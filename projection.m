function [J] = projection(I2,I1, H12)

Jh = size(I1,1);
Jw = size(I1,2);
I2h = size(I2,1);
I2w = size(I2,2);
J=I1;
for k = 1:size(I1,3)
    for i= 1:Jh
        for j= 1:Jw
            M2 = [j; i; 1];
            M1 = H12*M2;
            x = floor(M1(1)/M1(3));
            y = floor(M1(2)/M1(3));
            if (x>0 && x<=I2w && y>0 && y<=I2h)
                J(i,j,k)=I2(y,x,k);

            end
        end
    end
end



end

