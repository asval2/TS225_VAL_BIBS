clear all;
close all;
clc;
A = imread('./images/barbara.bmp');
[h, w] = size(A);
figure,imshow(A);
L1 = ginput(4);

h_ = 100;
w_ = 200;
%C=zeros(h_,w_);
%figure,imshow(uint8(C));

B = imread('./images/lena.bmp');
[h_, w_] = size(B);
L2=[ 1 1 ;w_ 1 ;w_ h_;1 h_];
%figure,imshow(B);
%L2 = ginput(4);

H = homo(L1, L2);
%homographie qui relie les 4 points choisis sur A  au rectangle L2


L2_ = [];
s = 1;
% verification M2=HM1
for i=1:4
Y=H*homogene(L1(i,:),s);
L2(i,:)
Y(1)/Y(3)
Y(2)/Y(3)
end
%% homographie du quadrangle au rectangle

%invH=H^(-1);
 %M2=HM1
born1=[min(L2(:,1)):max(L2(:,1))];
born2=[min(L2(:,2)):max(L2(:,2))];
for i=1:w
    for j=1:h
    M1_=[i*s ; j*s ; s];
    
    M2_=H*M1_;
    
    a=floor(M2_(1)/M2_(3));
    b=floor(M2_(2)/M2_(3));
    if(ismember(a,born1)&&ismember(b,born2))
    
        A(i,j)=B(a,b);
    end
    end
end
 figure, imshow(uint8(A));
% for i=min(L2(:,2)):max(L2(:,2))
%     for j=min(L2(:,1)):max(L2(:,1))
%         M1_=homogene( [i;j],s );
%         M2_=invH*M1_;
%         a=floor(M2_(1)/M2_(3))
%         b=floor(M2_(2)/M2_(3))
%         if(is
%         C(i,j)=A(a,b);
%     end
%     
%     imshow(uint8(C));
% end
% for i = 1:length(L1)
%     L1_ = [L1_; homogene(L1(i,:),s)];
% end
% 
% for i = 1:length(L1)
%     L2_ = [L2_; homogene(L1(i,:),s)];
% end
% 
% [X Y] = meshgrid(1:h,1:w);


