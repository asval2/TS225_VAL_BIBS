function [MIB] = mib_create(I)
[h w] = size(I);
M = ones(h,w,3);
B = [1  1; w h];
  for k=1:size(I,3)
        MIB.I(:,:,k) = I(:,:,k); 
     
  end
MIB.M=M;
MIB.B=B;
end

