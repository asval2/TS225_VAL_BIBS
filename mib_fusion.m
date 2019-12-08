function [MIB3] = mib_fusion(MIB1,MIB2)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
Mask1=MIB1.M;
Mask2=MIB2.M;
I1=MIB1.I;
I2=MIB2.I;

B1=MIB1.B;
s1=max(B1)-min(B1);
m1=s1(1);
n1=s1(2);
B2=MIB2.B; 
s2=max(B2)-min(B2);
m2=s2(1);
n2=s2(2);

%%Boite englobante
B3= [ min([B1;B2]);max([B1;B2])];
s3=max(B3)-min(B3);
m3=s3(1);
n3=s3(2);
%%fusion
Mask3=zeros(n,m);
I3 = zeros(n,m,size(I1,3));
for i=B3(1,1):B3(1,2)
    for j=B3(2,1):B3(2,2)
        a=0;
        b=0;
        
        if(ismember(i,[B1(1,1):B1(1,2)])&&ismember(j,[B1(2,1):B1(2,2)]))
            
            a=Mask1(i-n3,j-m3);
            I3(i-n3,j-m3,:)=I3(i-n3,j-m3,:)+I1(i-n3,j-m3,:);
            
            
        end
        
        if(ismember(i,[B2(1,1):B2(1,2)])&&ismember(j,[B2(2,1):B2(2,2)]))
            
            b=Mask2(i-n3,j-n3);
            I3(i-n3,j-m3,:)=I3(i-n3,j-m3,:)+I2(i-n3,j-m3,:);
            
        end
        
        Mask3(i-n3,j-n3)=a+b;
        I3(i-n3,j-m3,:)=I3(i-n3,j-m3,:)/(a+b);
    end
end 

MIB3.M=Mask3;
MIB3.I=I3;

end

