function out = idealLowpassFilter(img, D0)
    imgF = im2double(img);
    [row, col, num_ch] = size(imgF);
    P = 2*row;
    Q = 2*col;
    padded_img = zeros(P, Q, num_ch);
    img_FFT = zeros(size(padded_img));
    G = zeros(size(img_FFT));

    out = zeros(row, col, num_ch);

    u = -P/2:(P/2-1);
    v = -Q/2:(Q/2-1);
    [U, V] = meshgrid(v, u);
    D = sqrt(U.^2 + V.^2);

    H = double(D <= D0);

    for ch=1 : num_ch
        padded_img(1:row, 1:col, ch) = imgF(:, :, ch);

        img_FFT(:, :, ch) = fft2(padded_img(:, :, ch));
        img_FFT(:, :, ch) = fftshift(img_FFT(:, :, ch));
 
        G(:, :, ch) = H .* img_FFT(:, :, ch);

        out_img_FFT = G(:, :, ch);
        out_img_FFT = ifftshift(out_img_FFT);
        out_img_FFT = real(ifft2(out_img_FFT));

        out(:, :, ch) = out_img_FFT(1:row, 1:col);
    end

    out = im2uint8(out);
end