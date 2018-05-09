%
%%
% *Reconstruction Function*
% this function is used to reconstruct the original image.
function [laplacere]=laplacere(Gauss,Laplace,G)
 len=length(Gauss);
 imre=Gauss{len};
 for i=len:-1:2
     imre=ExpandG(imre,G);    
     imre=Laplace{i-1}+imre;     
 end
 % add Laplace layer with a expanded Gaussian pyramid layer
 laplacere=imre;
 end