function out = notchreject(img, notches)
    [w, h, num_ch] = size(img);
    out = zeros(w, h, num_ch);
    for c = 1:num_ch
        imgf = fft2(im2double(img(:,:,c)));
        imgf = fftshift(imgf);
        G = notchrejectF(imgf, notches);
        out(:,:,c) = real(ifft2(G));
    end
    out = im2uint8(out);
end

