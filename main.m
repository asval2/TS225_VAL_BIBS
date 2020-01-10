clear all;
close all;
clc;


%% Extraction de 1 vers 2
clear all;
close all;
clc;
% A = double(imread('./images/voiture.jpg'));
% [h, w, ~] = size(A);
% figure,imshow(uint8(A)),colormap(gray(256));
% L1 = ginput(4);
% close;
% hC = 256;
% wC =512;
% 
% C = zeros(hC, wC);
% 
% L2=[ 1 1 ;wC 1 ;wC hC;1 hC];
% H21 = homo(L2, L1); %H21
% 
% B=extraction(A, H21, size(C));
% figure,imshow(uint8(A)),colormap(gray(256));
% figure,imshow(uint8(B)),colormap(gray(256));
% % % 
% %% Projection de 2 vers 1
% A = imread('./images/panneau.jpg');
% [h, w, ~] = size(A);
% figure,imshow(A);
% L1 = ginput(4);
% close;
% B = imread('./images/advert.jpg');
% [h_, w_, ~] = size(B);
% L2=[ 1 1 ;w_ 1 ;w_ h_;1 h_];
% 
% H12 = homo(L1, L2); %H12
% 
% J = projection(B,A,H12);
% figure,imshow(J);%,colormap(gray(256));

%% Mosaique de 2 images
clear all;
close all;
clc;
I = double(imread('./images/bordeaux.jpg'));
figure,imshow(uint8(I));
[h, w, ~] = size(I);
m =100;
I1 = I(1:h,1:w/2+m,:);
I2 = I(1:h,w/2-m+1:end,:);
figure,imshow(uint8(I1));
figure,imshow(uint8(I2));
MIB1 = mib_create(I1);
MIB2 = mib_create(I2);

L1 =[w/2-m 1;w/2+m 1 ;w/2+m h ;w/2-m h ];
L2 =[1 1; 2*m 1; 2*m h; 1 h];


%H21 = homo(L2, L1); %H21
%H12 = homo(L1, L2); %H12

%Projection de l'image 2 dans l'espace de l'image 1
% MIB3 = mib_apply_homography(MIB1,H12);
% MIB4 = mib_fusion(MIB3,MIB2);
% figure,imshow(uint8(MIB4.I));

%Projection de l'image 1 dans l'espace de l'image 2
% MIB5 = mib_apply_homography(MIB2,H21);
% MIB6 = mib_fusion(MIB5,MIB1);
% figure,imshow(uint8(MIB6.I));

% Projection des deux images dans un espace englobant
L3=[w/2-m 1;w/2+m 1 ;w/2+m h ;w/2-m h];
H13 = homo(L1, L3); %H13
H23 = homo(L2, L3); %H23

MIB7 = mib_apply_homography(MIB1,H13);
MIB8 = mib_apply_homography(MIB2,H23);
MIB9 = mib_fusion(MIB7,MIB8);
figure,imshow(uint8(MIB9.I));

%% Mosaique de 4 images
clear all;
close all;
clc;
I = double(imread('./images/bordeaux.jpg'));
figure,imshow(uint8(I));
[h, w, ~] = size(I);
m =100;
I1 = I(1:h/2+m,1:w/2+m,:);
I2 = I(1:h/2+m,w/2-m+1:end,:);
I3 = I(h/2-m+1:end,w/2-m+1:end,:);
I4 = I(h/2-m+1:end,1:w/2+m,:);

subplot(2,2,1),imshow(uint8(I1));
subplot(2,2,2),imshow(uint8(I2));
subplot(2,2,4),imshow(uint8(I3));
subplot(2,2,3),imshow(uint8(I4));

MIB1 = mib_create(I1);
MIB2 = mib_create(I2);
MIB3 = mib_create(I3);
MIB4 = mib_create(I4);

L1 = [w/2-m 1;w/2+m 1 ;w/2+m h/2+m ;w/2-m h/2+m ];
L2 = [1 1; 2*m 1; 2*m h/2+m; 1 h/2+m];
L3 = [1 1; 2*m 1; 2*m 2*m; 1 2*m];
L4 = [w/2-m 1;w/2+m 1 ;w/2+m 2*m ;w/2-m 2*m ];


% Projection des deux images 1 2 dans un espace englobant 5
L5 = [w/2-m 1;w/2+m 1 ;w/2+m h/2+m ;w/2-m h/2+m ];

H15 = homo(L1, L5); %H15
H25 = homo(L2, L5); %H25

% MIB7 = mib_apply_homography(MIB1,H15);
% MIB8 = mib_apply_homography(MIB2,H25);
MIB5 = mib_fusion(mib_apply_homography(MIB1,H15),mib_apply_homography(MIB2,H25));
figure,imshow(uint8(MIB5.I));

% Projection des deux images 3 4 dans un espace englobant 6

L6 = [w/2-m 1;w/2+m 1 ;w/2+m 2*m ;w/2-m 2*m ];
H36 = homo(L3, L6); %H36
H46 = homo(L4, L6); %H46

% MIB7 = mib_apply_homography(MIB3,H36);
% MIB8 = mib_apply_homography(MIB4,H46);
MIB6 = mib_fusion(mib_apply_homography(MIB3,H36),mib_apply_homography(MIB4,H46));
figure,imshow(uint8(MIB6.I));

% Projection des deux images 5 6 dans un espace englobant 7

L5 = [1 h/2-m ;w h/2-m; w h/2+m  ;1 h/2+m ];
L6 = [1 1;w 1; w 2*m  ;1 2*m];
L7 = [1 h/2-m ;w h/2-m; w h/2+m  ;1 h/2+m ];

H57 = homo(L5, L7); %H36
H67 = homo(L6, L7); %H46

MIB7 = mib_fusion(mib_apply_homography(MIB5,H57),mib_apply_homography(MIB6,H67));
figure,imshow(uint8(MIB7.I));

% %Projection de l'image 2 dans l'espace de l'image 1
% L1 = [w/2-m 1;w/2+m 1 ;w/2+m h/2+m ;w/2-m h/2+m ];
% L2 = [1 1; 2*m 1; 2*m h/2+m; 1 h/2+m];
% 
% H12 = homo(L1, L2); %H12
% 
% MIB5 = mib_apply_homography(MIB1,H12);
% MIB6 = mib_fusion(MIB5,MIB2);
% figure,imshow(uint8(MIB6.I));
% 
% %Projection de l'image 3 dans l'espace de l'image 4
% L3 = [1 1; 2*m 1; 2*m 2*m; 1 2*m];
% L4 = [w/2-m 1;w/2+m 1 ;w/2+m 2*m ;w/2-m 2*m ];
% H43 = homo(L4, L3); %H43
% MIB7 = mib_apply_homography(MIB4,H43);
% MIB8 = mib_fusion(MIB3,MIB7);
% figure,imshow(uint8(MIB8.I));
% 
% L6 = [1 h/2-m ;w h/2-m; w h/2+m  ;1 h/2+m ];
% L8 = [1 1;w 1; w 2*m  ;1 2*m];
% 
% %Projection de l'image 8 dans l'espace de l'image 6
% H68 = homo(L6, L8); %H68
% MIB9 = mib_apply_homography(MIB6,H68);
% MIB10 = mib_fusion(MIB9,MIB8);
% figure,imshow(uint8(MIB10.I));

% 
% % Mosaique
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