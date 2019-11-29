function [X] = homo(L1,L2)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

%Creation de la matrice B%
[n m] = size(L2);
B=[];
for i = 1:n
    B= [B ; L2(i,1); L2(i,2)];
    
end
B

%Creation de la matrice A%
A=[];
for i=1:n
    x1 = L1(i,1);
    y1 = L1(i,2);
    x2 = L2(i,1);
    y2 = L2(i,2);
    A= [A; x1 y1 1 0 0 0 -x1*x2 -y1*x2 ];
    A= [A; 0 0 0 x1 y1 1 -x1*y2 -y1*y2 ];
end

X = A\B;


end

