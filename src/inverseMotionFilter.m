function out = inverseMotionFilter(img, H, threshold)
    imgF = im2double(img);
    [row, col, num_ch] = size(imgF);

    out = zeros(row, col, num_ch);

    inverse_H = zeros(row, col);

    valid = abs(H) >= threshold;
    inverse_H(valid) = 1 ./ H(valid);

    for ch = 1:num_ch
        img_FFT = fft2(imgF(:, :, ch));

        G = inverse_H .* img_FFT;

        out_img_FFT = real(ifft2(G));

        out(:, :, ch) = out_img_FFT;
    end

    out = im2uint8(out);
end