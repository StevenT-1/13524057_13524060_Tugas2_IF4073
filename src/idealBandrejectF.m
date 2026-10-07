function G = idealBandrejectF(imgf, D0, W)
    D = getD(imgf);
    [u, v] = size(D);
    H = zeros(u, v);
    for i = 1:u
        for j = 1:v
            if (D(i, j) < D0 - W/2) || (D(i, j) > D0 + W/2)
                H(i,j) = 1;
            else
                H(i,j) = 0;
            end
        end
    end
    H = fftshift(H);
    G = H.*imgf;
end