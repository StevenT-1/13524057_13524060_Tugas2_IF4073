function out = imgBrightenFourier(img, a, b)
    imgF = im2double(img);
    [row, col, num_ch] = size(imgF);

    out = zeros(row, col, num_ch);

    b = (b/255);
    for ch = 1:num_ch
        img_FFT = fft2(imgF(:, :, ch));

        img_FFT = a * img_FFT;
        img_FFT(1, 1) = img_FFT(1, 1) + b * row * col;

        out_img_FFT = real(ifft2(img_FFT));

        out(:, :, ch) = out_img_FFT;
    end

    out = im2uint8(out);
end
