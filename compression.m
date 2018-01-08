barbara=imread('C:\Users\Admin\Desktop\DA\Image and Video Analysisi\coursework\data\barbara.bmp');
barbara=im2double(barbara);
subplot(1,2,1);
imshow(barbara)

bar1=blkproc(barbara,[8 8],'dctforward(x)');
bar1=comthresholding(bar1,0.5);
bar=blkproc(bar1,[8 8],'dctbackward(x)');
subplot(1,2,2);
imshow(bar);
snr=ImageSnr(barbara,bar);
snr

% function D=comthresholding(I,s)
% sz=size(I);
% newI=zeros(sz(1),sz(1));
% for i=1:sz
%     for j=1:sz
%         if I(i,j)>=s || I(i,j)<=0-s
%             newI(i,j)=I(i,j);
%         else
%             newI(i,j)=0;
%         end
%     end
% end
% D=newI;
% end
% function snr = ImageSnr(oriI, noiI)  
%     Var = sum((oriI(:)-mean(oriI(:))).^2); 
%     RSS = sum((oriI(:)-noiI(:)).^2);  
%     snr = 10*log10(Var/RSS);  
% end  
           