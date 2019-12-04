function [MIB2] = mib_apply_homography(MIB1,H)
%% Homographie à la boite englobante
M1 = MIB1.M;
I1 = MIB1.I;
[ h w ] = size(I1);
B = MIB1.B;
born1=[B(1,1):B(1,1)+h];
born2=[B(1,2):B(1,2)+w];
B1=B(1,:);
B2=B(2,:);
[ n m ]=B1-B2;
B3=B1 + [n 0];
B4= B1 +[0 m];
L_1=H*homogene(B1,1);
L_2=H*homogene(B2,1);
L_3=H*homogene(B3,1);
L_4=H*homogene(B4,1);

B_=[ floor(L_1(1:2)/L_1(3)) ; floor(L_2(1:2)/L_2(3)) ; floor(L_3(1:2)/L_3(3)) ; floor(L_4(1:2)/L_4(3)) ];



MIB2.B= [ min(B_) ; max(B_)];

% I2  =extraction(I1,H,max(B_)-min(B_))
%% Projection de 1 sur 2
[ n m ] = max(B_)-min(B_);
Mask=zeros(n,m);
I2=zeros(n,m);
invH=inv(H);
for i=B1(1):B1(1)+n
    for j= B1(2):B1(2)+m
        M_2 = invH*homogene([i;j],1);
        M2= floor(M_2(1:2)/M_2(3));
        if (ismember(M2(1),born1)) && (ismember(M2(2),born2))
            I2(i-B1(1),j-B1(2),:)=I1(M2(1),M2(2),:);
            Mask(i-B1(1),j-B1(2))=1;
        end
    end
end

MIB2.M=Mask;
MIB2.I=I2;




end

