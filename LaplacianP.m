function lappy=LaplacianP(gpy,G)
% gpy=R
len=length(gpy);
for i=len-1:-1:1
%ExpandG is a expand function
        exp=ExpandG(gpy{i+1},G);
% figure;imshow(gpy{i}-exp);
        ladata{i}=gpy{i}-exp;   
end
lappy=ladata;
lappy{len}=gpy(len);
end