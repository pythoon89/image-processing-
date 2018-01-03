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
% imshow(D)
end