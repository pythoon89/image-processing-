
function D=dctforward(I)
% estimate the size of  input picture "I"
sz=size(I);
m=sz(1);
DM=zeros(m,m);
%build dct matrix 
for i = 0:m-1
    for j = 0:m-1
        if i == 0
            DM(i+1,j+1) = ((1/m)^0.5)*cos(((2*j+1)*i*pi)/(2*m));
        else
            DM(i+1,j+1) = ((2/m)^0.5)*cos(((2*j+1)*i*pi)/(2*m));
        end
    end
end
%process dct transform.
D=DM*I(:,:,1)*DM';
end
