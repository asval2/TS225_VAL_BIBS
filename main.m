clear all;
close all;
clc;
A = imread('./images/lena.bmp');
[h, w] = size(A);
figure,imshow(A);
L1 = ginput(4);

B = imread('./images/barbara.bmp');
[h_, w_] = size(B);
figure,imshow(B);
L2 = ginput(4);

H = homo(L1, L2);
H = [H; 1];
H = reshape(X,3,3);
L1_ = [];
L2_ = [];
s = 1;

for i = 1:length(L1)
    L1_ = [L1_; homogene(L1(i,:),s)];
end

for i = 1:length(L1)
    L2_ = [L2_; homogene(L1(i,:),s)];
end

[X Y] = meshgrid(1:h,1:w);


