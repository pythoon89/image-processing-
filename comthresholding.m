%I means the input image, s means the value of threshold
function D=comthresholding(I,s)
%estimate the size of input image
sz=size(I);
newI=zeros(sz(1),sz(2));
%if the abs value of input image is no more than s, it will be set as "0" 
for i=1:sz(1)
    for j=1:sz(2)
        if I(i,j)>=s || I(i,j)<=0-s
            newI(i,j)=I(i,j);
        else
            newI(i,j)=0;
        end
    end
end
%return the new matrix
D=newI;
end
