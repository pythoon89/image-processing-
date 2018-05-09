%% Question3
clc;
clear;
addpath('C:\Users\Admin\Desktop\DA\Image and Video Analysisi\coursework\data\');
inputimage=imread('test.bmp');
% judge if the picture is gray, if not, convert input picture to gray
% version.
if ndims(inputimage)==3
    inputimage=rgb2gray(inputimage);
else
    inputimage=inputimage;
end
im=im2double(inputimage);
%------------------------------------------------------------------------------
b=1;
[m,n]=size(im);
%set different thresholding values
for i=0.15:0.05:1
    %DCT transform
    imdct=blkproc(im,[8,8],'dctforward');
    %filtering with thresholds
    imcom=comthresholding(imdct,i);
    %reconstruction
    imre=blkproc(imcom,[8,8],'dctbackward');
    % calculate the SNR
    snr(b)=ImageSnr(im,imre);
    %DLE 
    imcode=Dle2(imcom);
    codelen=length(imcode{1})+length(imcode{2});
    %calculate the compression rate
    cr1(b)=(codelen*8)/(m*n);
    b=b+1 ;
end
   figure; plot(cr1,snr);
   title('Rate-Distortion Curve, test')
   xlabel('CR(bpps)')
   ylabel('SNR(dBs)')
    
