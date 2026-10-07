function F2 = getSpectrum(img)
    if (size(img, 3) > 1) 
        img = rgb2gray(img);
    end
    F = fft2(im2double(img));
    F = fftshift(F);
    F2 = log(abs(F) + 1);
end