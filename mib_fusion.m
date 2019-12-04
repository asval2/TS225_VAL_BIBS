function [MIB3] = mib_fusion(MIB1,MIB2)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
Mask1=MIB1.M;
Mask2=MIB2.M;
I1=MIB1.I;
I2=MIB2.I;

B1=MIB1.B;
B2=MIB2.B; 

%%Boite englobante
B3= [ min([B1;B2]);max([B1;B2])];

[n1 m1]=size(Mask1);

[n2 m2]=size(Mask2);
[n m]=max(B3)-min(B3); 
Mask3=zeros(n,m);
I3 = zeros(n,m,size(I1,3));
for i=B3(1):B3(1)+n
    for j=B3(2):B3(2)+m
        a=0;
        b=0;
        
        if(ismember(i,[B1(1):B1(1)+n1])&&ismember(j,[B1(2):B1(2)+m1]))
            
            a=Mask1(i,j);
            
        end
        
        if(ismember(i,[B2(1):B2(1)+n2])&&ismember(j,[B2(2):B2(2)+m2]))
            
            b=Mask2(i,j);
            
        end
        
        Mask3(i,j)=a+b;
        
    end
end 

MIB3.M=Mask3;


end

