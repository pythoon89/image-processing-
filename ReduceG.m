function R=ReduceG(I)
sz=size(I);
newsz=sz(1)/2;
r=zeros(newsz,newsz);
for i=1:newsz
    for j=1:newsz
        r(i,j)=I(2*i-1,2*j-1);
    end
end
R=r;
end

