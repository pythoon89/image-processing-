%%
% *%The main function of Question4&5*
clc;
clear;
addpath('C:\Users\Admin\Desktop\DA\Image and Video Analysisi\coursework\data\');
inputimage=imread('Lena.bmp');
%if the input image is not gray version transfer it into gray version.
if ndims(inputimage)==3
    inputimage=rgb2gray(inputimage);
else
    inputimage=inputimage;
end
im=im2double(inputimage);
%calculate the value of Gauss kernel, the radius is 2 and the sigma is 1.2.
G=Gauss21(2,1.2);
gsspy=Gaussianp(im,G);
lplpy=LaplacianP(gsspy,G);
lpre=laplacere(gsspy,lplpy,G);
%print the Gaussian and Laplace Pyramid.
for i=1:3
    figure;imshow(lplpy{i});
    title('Laplacian Pyramid');
    figure;imshow(gsspy{i});
    title('Gaussian Pyramid');
end
figure;imshow(lpre);
title('reconstruction');
%calculate the value of SNR and compression rate under different threshold.
a=1;
for threshold=0.05:0.025:1
    [cr(a),comladata]=lacomrate(im,lplpy,threshold);
    lapre=laplacere(gsspy,comladata,G);
    
    snr(a)=ImageSnr(im,lapre);
    a=a+1;
end
figure; plot(cr,snr)
   title('Image Pyramid Rate-Distortion Curve, Lena')
   xlabel('CR(bpps)')
   ylabel('SNR(dBs)')


