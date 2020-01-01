clear all;
close all;
clc;


%% Extraction de 1 vers 2
A = double(imread('./images/voiture.jpg'));
[h, w, ~] = size(A);
figure,imshow(uint8(A)),colormap(gray(256));
L1 = ginput(4);
close;
hC = 256;
wC =512;

C = zeros(hC, wC);

L2=[ 1 1 ;wC 1 ;wC hC;1 hC];
H21 = homo(L2, L1); %H21

B=extraction(A, H21, size(C));
figure,imshow(uint8(A)),colormap(gray(256));
figure,imshow(uint8(B)),colormap(gray(256));
% % 
%% Projection de 2 vers 1
A = imread('./images/panneau.jpg');
[h, w, ~] = size(A);
figure,imshow(A);
L1 = ginput(4);
close;
B = imread('./images/advert.jpg');
[h_, w_, ~] = size(B);
L2=[ 1 1 ;w_ 1 ;w_ h_;1 h_];

H12 = homo(L1, L2); %H12

J = projection(B,A,H12);
figure,imshow(J);%,colormap(gray(256));

%% Mosaique
% I = double(imread('./images/BIBS.jpeg'));
% [h w] = size(I);
% figure,imshow(uint8(I));
% % L1 = ginput(4);
% % L2=[ 1 1 ;w 1 ;w h;1 h];
% % figure,imshow(uint8(I));
% % L2 = ginput(4);
% 
% MIB1 = mib_create(I);
% theta =pi/3;
% H = [cos(theta) -sin(theta) 0;
%     sin(theta) cos(theta) 0;
%     0 0 1];
% % % H = homo(L2, L1);
% MIB2 = mib_apply_homography(MIB1,H);
% figure,imshow(uint8(MIB2.I));
% % 
% 
% MIB3 = mib_fusion(MIB1,MIB2);
% figure,imshow(uint8(MIB3.I));

%% 