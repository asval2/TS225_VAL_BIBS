function [X] = homo(L1,L2)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

%C�ationde la matrice B%
[n m] = size(L2);
B=[];
for i = 1:n
    B= [B ; L2(n,1)];
    B= [B ; L2(n,2)];
end

%Cr�ation de la matrice A%
A=[];
for i=1:n
    x1 = L1(n,1);
    y1 = L1(n,2);
    x2 = L2(n,1);
    y2 = L2(n,2);
    A= [A; x1 x2 1 0 0 0 -x1*x2 -y1*x2];
    A= [A; 0 0 0 x1 y1 1 -x1*y2 -y1*y2 ];
end
X = A\B;


outputArg1 = inputArg1;
outputArg2 = inputArg2;
end

