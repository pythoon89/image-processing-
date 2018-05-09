
function D=Dle2(Image)
%estimate the size of input image
length=size(Image);
% store all data in a 1 demension list
len=length(1)*length(2);
Im=zeros(1,len);
in=1;
    for m=1:length(1)
    for n=1:length(2)
         Im(in)=Image(m,n);
         in=in+1;
    end
    end
    j=1;
run(1)=1;
for i=1:(len-1)
    if Im(i)~=Im(i+1)
        data(j)=Im(i);
         j=j+1;
        run(j)=1;
    else
         run(j)=run(j)+1;
    end
end
data(j)=Im(len);
%stroe run length in list "run", store data in list "data".
D{1}=run;
D{2}=data;
end
