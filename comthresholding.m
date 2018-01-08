
function D=comthresholding(I,s)
sz=size(I);
newI=zeros(sz(1),sz(1));
for i=1:sz
    for j=1:sz
        if I(i,j)>=s || I(i,j)<=0-s
            newI(i,j)=I(i,j);
        else
            newI(i,j)=0;
        end
    end
end
D=newI;
end
function snr = ImageSnr(oriI, noiI)  
    Var = sum((oriI(:)-mean(oriI(:))).^2); 
    RSS = sum((oriI(:)-noiI(:)).^2);  
    snr = 10*log10(Var/RSS);  
end  