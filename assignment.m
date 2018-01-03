mypicture=imread('C:\Users\Admin\Desktop\DA\Image and Video Analysisi\coursework\data\lena.bmp');
mypicture=im2double(mypicture);

% mypicture
FF1=dctforward(mypicture);
% FF=dct(mypicture);
figure(),imshow(mypicture)
% FF2=blockn(mypicture);
FF3=dctbackward(FF1)
subplot(1,1,1);
imshow(FF3);title('backward');


function D=dctforward(I)
sz=size(I);
m=sz(1);
DM=zeros(m,m);

for i = 0:m-1
    for j = 0:m-1
        if i == 0
            DM(i+1,j+1) = ((1/m)^0.5)*cos(((2*j+1)*i*pi)/(2*m));
        else
            DM(i+1,j+1) = ((2/m)^0.5)*cos(((2*j+1)*i*pi)/(2*m));
        end
    end
end
D=DM*I(:,:,1)*DM';
% D2=DM*I(:,:,2)*DM';
% D3=DM*I(:,:,3)*DM';
imshow(D)
end

function D=dctbackward(I)
sz=size(I);
m=sz(1);
DM=zeros(m,m);

for i = 0:m-1
    for j = 0:m-1
        if i == 0
            DM(i+1,j+1) = ((1/m)^0.5)*cos(((2*j+1)*i*pi)/(2*m));
        else
            DM(i+1,j+1) = ((2/m)^0.5)*cos(((2*j+1)*i*pi)/(2*m));
        end
    end
end
D=DM'*I(:,:,1)*DM;
% D2=DM*I(:,:,2)*DM';
% D3=DM*I(:,:,3)*DM';
imshow(D)
end
% function B=blockn(I)
% sz=size(I);
% nr=sz(1);
% nc=sz(2);
% numblock=64;  % NxN blocks
% rem1=rem(sz(1),numblock);
% rem2=rem(sz(2),numblock);
% % make original martrix be square
% if nc~=nr
%     if nc>nr
%         I(sz+nc-nr,:)=0;
%     else
%         I(:,sz+nr-nc)=0;
%     end
% end
% % fill the objective matrix with 0 so that it can be divided by n blocks
% if rem1~=0
%     I(sz+numblock-rem1,:,:)=0;  
% end
% if rem2~=0
%     I(:,sz+numblock-rem2,:)=0;  
% end    
% %calculate the new number of colums and rows. Divide the original picture
% sz2=size(I);
% nump=sz2/numblock;    
% k=1;
% new=zeros(numblock,numblock,)
% % block=zeros(numblock,numblock);
% for i=0:nump-1   
%     m=i*numblock;
%     for j=0:nump-1
%         n=j*numblock;        
%         block=I(m+1:m+numblock,n+1:n+numblock,:);
%         new(k)=block;
%         subplot(8, 8, k); 
%         k=k+1;
%         imshow(block);        
%     end   
% end
% B=1
% end
