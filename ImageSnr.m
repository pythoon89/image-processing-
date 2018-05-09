
function snr = ImageSnr(oriI, nI)  
    Var = sum((oriI(:)-mean(oriI(:))).^2); 
    RSS = sum((oriI(:)-nI(:)).^2);  
    snr = 10*log10(Var/RSS);  
end 