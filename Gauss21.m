

function G=Gauss21(r,sigma)
n=r*2+1;
g=zeros(n,n);
% build Gauss martrix
for i=-r:r
    for j=-r:r
        g(i+r+1,j+r+1)=exp(-(i^2+j^2)/2*sigma^2);
    end
end
% 
g=g/sum(sum(g));
G=g;
end
