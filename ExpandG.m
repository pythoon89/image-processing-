function E=ExpandG(I)
sz=size(I);
newsz=sz(1)*2;
expand=zeros(newsz,newsz);
for i=1:sz
    for j=1:sz
        expand(2*i-1,2*j-1)=I(i,j);
    end
end

E=expand;
end    