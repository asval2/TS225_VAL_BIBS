function J=extraction(I, H, s)
    Jh=s(1); Jw=s(2);
    [X2,Y2]=meshgrid(1:Jw,1:Jh);
    X=zeros(Jh,Jw);
    Y=zeros(Jh,Jw);
    for n=1:numel(X2)
        M2=[X2(n); Y2(n); 1];
        M = H*M2;
        X(n)=M(1)/M(3); Y(n)=M(2)/M(3);
    end
    J=zeros(Jh,Jw,size(I,3));
    for k=1:size(I,3)
        J(:,:,k) = interp2(I(:,:,k), X,Y,'linear',0);
    end
end
