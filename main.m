clear all;
close all;
clc;


% %% Extraction de 1 vers 2
% A = double(imread('./images/barbara.bmp'));
% [h, w] = size(A);
% figure,image(A),colormap(gray(256));
% L1 = ginput(4);
% hC = 256;
% wC = 512;
% 
% C = zeros(hC, wC);
% 
% L2=[ 1 1 ;wC 1 ;wC hC;1 hC];
% H = homo(L2, L1); %H21
% 
% J=extraction(A, H, size(C));
% figure,image(J),colormap(gray(256));
% 
% %% Projection de 2 vers 1
% A = double(imread('./images/barbara.bmp'));
% [h, w] = size(A);
% figure,image(A),colormap(gray(256));
% L1 = ginput(4);
% 
% B = double(imread('./images/lena.bmp'));
% [h_, w_] = size(B);
% L2=[ 1 1 ;w_ 1 ;w_ h_;1 h_];
% 
% H = homo(L1, L2); %H12
% 
% J=extraction(B, H, size(A));
% figure,image(J),colormap(gray(256));
% mask = J==0;
% D = A.*mask + J;
% figure,image(D),colormap(gray(256));

%% Mosaique
I = double(imread('./images/barbara.bmp'));

MIB1 = mib_create(I);



