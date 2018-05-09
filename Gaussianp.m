% 
%%
% *Gaussian pyramid*
%I is the input image, G is the Gauss kernel
function R=Gaussianp(I,G)
sz=size(I);
N=log2(sz(1));
Gpyramid{1}=I;
r=I;
for index=2:N
[m,n]=size(r);
%apply Gausse smmothing
smoothimage=conv2(r,G);
smoothimage=smoothimage(3:m+2,3:n+2);
%subsamping
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

 
% 
%%
% *supersampling method*
function E=ExpandG(I,G)
sz=size(I);
newsz=sz(1)*2;
expand=zeros(newsz,newsz);
for i=1:sz
    for j=1:sz
        expand(2*i-1,2*j-1)=I(i,j);
    end
end
expand=conv2(expand,4*G);
%after supersampling, apply Gausse kernel again
expand=expand(3:2*sz(1)+2,3:2*sz(2)+2);
E=expand;
end    