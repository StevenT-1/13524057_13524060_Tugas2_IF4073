function out = gaussianBandrejectF(imgf, D0, W)
    D = getD(imgf);
    H = 1 - exp(-(((D.^2 - D0^2)./(D*W)).^2)/2);
    H = fftshift(H);
    out = H.*imgf;
end