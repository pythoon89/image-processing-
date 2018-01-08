clc
clear
G=Gauss21(2,1);
barbara=imread('C:\Users\Admin\Desktop\DA\Image and Video Analysisi\coursework\data\lena.bmp');
barbara=im2double(barbara);
barbara=rgb2gray(barbara);
% C=conv2(barbara,G);

% C=C(2:size(C)-1,2:size(C)-1);
C=conv2(barbara,G);

sz=size(C);
rg=C(3:sz(1)-2,3:sz(1)-2);

data{1}=barbara;
% data{2}=rg;

for i=2:10
    rg=ReduceG(rg);
    data{i}=rg;
end
for i=2:10
ex=ExpandG(data{i});
ex=conv2(ex,4*G);
sz=size(ex);
 ex=ex(3:sz(1)-2,3:sz(1)-2);
exdata{i-1}=ex;
end
for i=1:9
    ladata{i}=data{i}-exdata{i};
    subplot(2,5,i)
    imshow(ladata{i})
end
 
 lasize=size(ladata);
 len=0;
 for i=1:9
     D=comthresholding(ladata{i},0.08);
     lacomdata{i}=D;
     D=Dlc2(D);
     len=len+size(D{1})+size(D{2});
     
 end
 imre=data{9};
 for i=8:-1:1
     
     imre=ExpandG(imre);
     imre=conv2(imre,4*G);
     
     sz=size(imre);
     imre=imre(3:sz(1)-2,3:sz(1)-2);
     imre=lacomdata{i}+imre;
     
 end
 figure;imshow(imre)
     
 
 
% 
% 
% subplot(2,3,1)
% imshow(barbara)
% subplot(2,3,2)
% imshow(C)
% subplot(2,3,3)
% imshow(rg)
% subplot(2,3,4)
% imshow(ex)
% subplot(2,3,5)
% imshow(la)
% Be=ExpandG(barbara);
% Be=conv2(Be,4*G);
% subplot(2,3,6)
% imshow(Be)


% function R=ReduceG(I)
% sz=size(I);
% newsz=sz(1)/2;
% r=zeros(newsz,newsz);
% for i=1:newsz
%     for j=1:newsz
%         r(i,j)=I(2*i-1,2*j-1);
%     end
% end
% R=r;
% end

% function E=ExpandG(I)
% sz=size(I);
% newsz=sz(1)*2;
% expand=zeros(newsz,newsz);
% for i=1:sz
%     for j=1:sz
%         expand(2*i-1,2*j-1)=I(i,j);
%     end
% end
% 
% E=expand;
% end    
