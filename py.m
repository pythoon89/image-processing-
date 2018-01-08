G=Gauss21(2,1);
barbara=imread('C:\Users\Admin\Desktop\DA\Image and Video Analysisi\coursework\data\lena.bmp');
barbara=im2double(barbara);
barbara=rgb2gray(barbara);
C=conv2(barbara,G);
C=C(3:size(C)-2,3:size(C)-2);
% C=C(2:size(C)-1,2:size(C)-1);


rg=ReduceG(C);
% for i=1:2
%     rg=ReduceG(rg);
%     data{i}=rg;
% end
ex=ExpandG(rg);
ex=conv2(ex,4*G);
ex=ex(3:size(ex)-2,3:size(ex)-2);
la=barbara-ex;
subplot(2,3,1)
imshow(barbara)
subplot(2,3,2)
imshow(C)
subplot(2,3,3)
imshow(rg)
subplot(2,3,4)
imshow(ex)
subplot(2,3,5)
imshow(la)


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


    
