clear all;
close all;
clc;
A = imread('./images/lena.bmp');
[h, w] = size(A);
figure,imshow(A);
L1 = ginput(4);

L2=[ 50 50 ;50 300;300 50;300 300];
%B = imread('./images/barbara.bmp');
%[h_, w_] = size(B);
%figure,imshow(B);
%L2 = ginput(4);

H = homo(L1, L2);
%homographie qui relie les 4 points choisis sur A  au rectangle L2
H = [H ; 1];
H = reshape(H',3,3);
L1_ = [];
L2_ = [];
s = 1;
% verification M2=HM1
for i=1:4
H*homogene(L1(i,:),s)
end
%% homographie du quadrangle au rectangle
C=zeros(size(A));
invH=H^(-1);
%M2=HM1
for i=min(L2(:,2)):max(L2(:,2))
    for j=min(L2(:,1)):max(L2(:,1))
        M1_=homogene( [i;j],s );
        M2_=invH*M1_;
        a=floor(M2_(1)/M2_(3))+1
        b=floor(M2_(2)/M2_(3))+1
        C(i,j)=A(a,b);
    end
    
    imshow(uint8(C));
end
for i = 1:length(L1)
    L1_ = [L1_; homogene(L1(i,:),s)];
end

for i = 1:length(L1)
    L2_ = [L2_; homogene(L1(i,:),s)];
end

[X Y] = meshgrid(1:h,1:w);


