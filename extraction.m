function J=extraction(I, H, s)
    Jh=s(1); Jw=s(2);
    [X2,Y2]=meshgrid(1:Jw,1:Jh);
    X1=zeros(Jh,Jw);
    Y1=zeros(Jh,Jw);
    for n=1:numel(X2)
        M2=[X2(n); Y2(n); 1];
        M1 = H*M2;
        X1(n)=M1(1)/M1(3); Y1(n)=M1(2)/M1(3);
    end
    J=zeros(Jh,Jw,size(I,3));
    for k=1:size(I,3)
        J(:,:,k) = interp2(I(:,:,k), X1,Y1,'linear',0);
    end
end
