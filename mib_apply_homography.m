function [MIB2] = mib_apply_homography(MIB1,H)
%% Homographie à la boite englobante
M1 = MIB1.M;
I1 = MIB1.I;
h =  size(I1,1);
w = size(I1,2);

B = MIB1.B;
% born1=[B(1,1):B(1,1)+h];
% born2=[B(1,2):B(1,2)+w];

B1=B(1,:)
B2=B(2,:)

s=B2-B1+1;
n=s(1);
m=s(2);
B3=B1 + [n-1 0];
B4= B1 +[0 m-1];
L_1=H*homogene(B1,1);
L_2=H*homogene(B2,1);
L_3=H*homogene(B3,1);
L_4=H*homogene(B4,1);

B_=[ (L_1(1:2)/L_1(3))';  (L_2(1:2)/L_2(3))';  (L_3(1:2)/L_3(3))';  (L_4(1:2)/L_4(3))' ]



MIB2.B= [ min(round(B_)) ; max(floor(B_))];
B_=MIB2.B

% I2  =extraction(I1,H,max(B_)-min(B_))
%% Projection de 1 sur 2
s2 = B_(2,:)-B_(1,:)+1;
n = s2(2)
m = s2(1)
Mask=zeros(n,m);
I2=ones(n,m);
invH=inv(H);
for i= B_(1,2):B_(2,2)
    for j=B_(1,1):B_(2,1)

%         i
%         j
        M_2 = invH*homogene([i;j],1);
        M2= floor(M_2(1:2)/M_2(3));
        x = M2(1);
        y = M2(2);
        
        if (x>=B1(2) && x<=B2(2) && y>=B1(1) && y<=B2(1))
%             i-B_(1,2)+1
%             j-B_(1,1)+1
            I2(i-B_(1,2)+1,j-B_(1,1)+1) = I1(x,y);
            Mask(i-B_(1,2)+1,j-B_(1,1)+1) = 1;
        end
        
    end
    
end

MIB2.M=Mask;
MIB2.I=I2;




end

