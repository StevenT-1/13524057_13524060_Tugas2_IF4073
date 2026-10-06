function out = butterworthBandreject(imgf, D0, W, n)
    D = getD(imgf);
    H = 1./(1 + ((D*W)./(D.^2 - D0^2)).^(2*n));
    H = fftshift(H);
    out = H.*imgf;
end