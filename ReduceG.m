
function R=ReduceG(I)
sz=size(I);
N=log2(sz(1));
Gpyramid{1}=I;
G=Gauss21(2,1);
r=I;
for index=2:N+1
[m,n]=size(r);
smoothimage=conv2(r,G);
smoothimage=smoothimage(3:m+2,3:n+2);
newsz=m/2;
r=zeros(newsz,newsz);
for i=1:newsz
    for j=1:newsz
        r(i,j)=smoothimage(2*i-1,2*j-1);
    end
end
    Gpyramid{index}=r;
end
R=Gpyramid;
end
