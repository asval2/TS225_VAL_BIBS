function [MIB3] = mib_fusion(MIB1,MIB2)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
Mask1=MIB1.M;
Mask2=MIB2.M;
I1=MIB1.I;
I2=MIB2.I;

B1=MIB1.B;
s1=B1(2,:)-B1(1,:)+1;
m1=s1(1);
n1=s1(2);
B2=MIB2.B; 
s2=B2(2,:)-B2(1,:)+1;
m2=s2(1);
n2=s2(2);

%% Boite englobante
B3= [min([B1;B2]);max([B1;B2])];
s3=B3(2,:)-B3(1,:)+1;
m3=s3(1);
n3=s3(2);

%% fusion
Mask3=zeros(n3,m3);
I3 = zeros(n3,m3,size(I1,3));
B3(1,1);
B3(1,2);
B3(2,1);
B3(2,2);
for i=B3(1,1):B3(2,1)
    for j=B3(1,2):B3(2,2)
        a=0;
        b=0;

         if(i>=B1(1,1) && i<=B1(2,1) && j>=B1(1,2) &&  j<=B1(2,2))
            a=Mask1(j-B1(1,2)+1,i-B1(1,1)+1);
            I3(j-B3(1,2)+1,i-B3(1,1)+1,:)=I3(j-B3(1,2)+1,i-B3(1,1)+1,:)+a*I1(j-B1(1,2)+1,i-B1(1,1)+1,:);
            
      
         end
 
        if(i>=B2(1,1) && i<=B2(2,1) && j>=B2(1,2) &&  j<=B2(2,2))
            b=Mask2(j-B2(1,2)+1,i-B2(1,1)+1);
            I3(j-B3(1,2)+1,i-B3(1,1)+1,:)=I3(j-B3(1,2)+1,i-B3(1,1)+1,:)+b*I2(j-B2(1,2)+1,i-B2(1,1)+1,:);
            
        end
        if(a+b~=0)
            Mask3(j-B3(1,2)+1,i-B3(1,1)+1)=a+b;
            I3(j-B3(1,2)+1,i-B3(1,1)+1,:)=I3(j-B3(1,2)+1,i-B3(1,1)+1,:)/(a+b);
        end
     end
end 

MIB3.M=Mask3;
MIB3.I=I3;
MIB3.B=B3;

end

