function snr = ImageSnr(oriI, noiI)  
    Var = sum((oriI(:)-mean(oriI(:))).^2); 
    RSS = sum((oriI(:)-noiI(:)).^2);  
    snr = 10*log10(Var/RSS);  
end 