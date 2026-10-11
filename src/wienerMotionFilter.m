function out = wienerMotionFilter(img, H, K)
    imgF = im2double(img);
    [row, col, num_ch] = size(imgF);

    out = zeros(row, col, num_ch);

    denominator = abs(H).^2 + K;

    W = zeros(row, col);

    valid = denominator > 0;
    W(valid) = conj(H(valid)) ./ denominator(valid);

    for ch = 1:num_ch
        img_FFT = fft2(imgF(:, :, ch));

        G = W .* img_FFT;

        out_img_FFT = real(ifft2(G));

        out(:, :, ch) = out_img_FFT;
    end

    out = im2uint8(out);
end