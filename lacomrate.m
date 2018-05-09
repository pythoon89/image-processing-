
function [DR,comladata]=lacomrate(image,ladata,thresholding)
[m,n]=size(image);
 lasize=length(ladata);
 len=0;
 for i=1:lasize-1
     D=comthresholding(ladata{i},thresholding);
     lacomdata{i}=D;
     D=Dlc2(D);
     len=len+length(D{1})+length(D{2});
     DR=len*8/(m*n);
 end
 DR=DR;
 comladata=lacomdata;
end