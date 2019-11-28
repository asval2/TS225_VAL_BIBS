clear all;
close all;
clc;
A = imread('./images/lena.bmp');
[h, w] = size(A);
figure,imshow(A);
L1 = [ h/2 h w w/2];

B = imread('./images/barbara.bmp');
[h_, w_] = size(B);
%imresize?
figure,imshow(B);
L2 =[ h_/2 h_ w_ w_/2];

H = homo(L1, L2); %homographie qui lie les quadrangles M et M'
H = [H; 1];
H = reshape(H,3,3);
L1_ = [];
L2_ = [];
s = 1;
born1=[h/2:1:h];
born2=[w/2:1:w];

C=[];
C=A;
for i=1:h
    for j=1:w
        if ( (ismember(i,born1)) && (ismember(j,born2)) )
            
        end
        
    end
end
