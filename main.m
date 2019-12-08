clear all;
close all;
clc;


% %% Extraction de 1 vers 2
% % A = double(imread('./images/barbara.bmp'));
% % [h, w] = size(A);
% % figure,image(A),colormap(gray(256));
% % L1 = ginput(4);
% % hC = 256;
% % wC = 512;
% % 
% % C = zeros(hC, wC);
% % 
% % L2=[ 1 1 ;wC 1 ;wC hC;1 hC];
% % H = homo(L2, L1); %H21
% % 
% % J=extraction(A, H, size(C));
% % figure,image(J),colormap(gray(256));
% % 
% %% Projection de 2 vers 1
% A = imread('./images/foreground.jpg');
% [h, w, ~] = size(A);
% figure,imshow(A);
% L1 = ginput(4);
% close;
% B = imread('./images/background.jpg');
% [h_, w_, ~] = size(B);
% L2=[ 1 1 ;w_ 1 ;w_ h_;1 h_];
% 
% % A = imread('./images/barbara.bmp');
% % [h, w, ~] = size(A);
% % figure,imshow(A);
% % L1 = ginput(4);
% % close;
% % B = imread('./images/lena.bmp');
% % [h_, w_, ~] = size(B);
% % L2=[ 1 1 ;w_ 1 ;w_ h_;1 h_];
% 
% H = homo(L1, L2); %H12
% 
% % Jw= w;
% % Jh = h;
% % J=A;
% % for i= 1:Jh
% %     for j= 1:Jw
% %         M2 = [j; i; 1];
% %         M1 = H*M2;
% %         a = floor(M1(1)/M1(3));
% %         b = floor(M1(2)/M1(3));
% %         if (a>0&&a<=w_&&b>0&&b<=h_)
% %             J(i,j)=B(b,a);
% %         
% %         end
% %     end
% % end
% 
% J = projection(B,A,H);
% % 
% 
% % J=extraction(B, H, size(A));
% figure,imshow(J);%,colormap(gray(256));
% % mask = J==0;
% % D = A.*mask + J;
% % figure,image(D),colormap(gray(256));

%% Mosaique
I = double(imread('./images/barbara.bmp'));
[h w] = size(I);
figure,imshow(uint8(I));
L1 = ginput(4);
L2=[ 1 1 ;w 1 ;w h;1 h];


MIB1 = mib_create(I);
theta = pi/3;
% H = [cos(theta) -sin(theta) 0;
%     sin(theta) cos(theta) 0;
%     0 0 1];
H = homo(L2, L1);
MIB2 = mib_apply_homography(MIB1,H);
figure,imshow(uint8(MIB2.I));


