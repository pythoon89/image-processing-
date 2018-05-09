%% Question1 & Question2
clc;
clear;
addpath('C:\Users\Admin\Desktop\DA\Image and Video Analysisi\coursework\data\');
% the path should be modified to real path.
 image=imread('Barbara.bmp');
image=im2double(image);
% give a  list of the size of block.
sz=[8,16,64];
len=length(sz);
for i=1:length(sz)
% take nxn blocks from input picture.
n=sz(i);
imageblock=image(1:n,1:n);
%dct transform
imagedct=dctforward(imageblock);
%dct reconstructed
imagedctback=dctbackward(imagedct);
subplot(2,len,i);
imshow(imagedct);
title('dctforward');
subplot(2,len,len+i);
imshow(imagedctback);
title('dctbackward');
end
