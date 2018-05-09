function E=ExpandG(I,G)

sz=size(I);
newsz=sz(1)*2;
expand=imresize(I,2,'bilinear');
% expand=zeros(newsz,newsz);
% for i=1:sz
%     for j=1:sz
%         expand(2*i-1,2*j-1)=I(i,j);
%     end
% end
expand=conv2(expand,G);
expand=expand(3:2*sz(1)+2,3:2*sz(2)+2);
E=expand;
end    