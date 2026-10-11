function H = motionBlurPSF(row, col, LEN, THETA, T)
    arguments
        row
        col
        LEN
        THETA
        T=1
    end

    dx = LEN * cosd(THETA);
    dy = -LEN * sind(THETA);

    a = dx / col;
    b = dy / row;

    u = -floor(col/2) : ceil(col/2)-1;
    v = -floor(row/2) : ceil(row/2)-1;
    [U, V] = meshgrid(u, v);

    s = U*a + V*b;

    H = T * ones(row, col);

    nonzero = abs(s) > 1e-12;

    H(nonzero) = T * sin(pi*s(nonzero)) ./ (pi*s(nonzero)) .* exp(-1i*pi*s(nonzero));

    H = ifftshift(H);
end