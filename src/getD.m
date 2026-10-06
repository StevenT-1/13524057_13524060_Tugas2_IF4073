function D = getD(imgspc)
    [w, h] = size(imgspc);

    u = 0:w-1;
    v = 0:h-1;

    idx = find(u > w/2);
    u(idx) = u(idx) - w;
    idx = find(v > h/2);
    v(idx) = v(idx) - h;

    [U, V] = meshgrid(v, u);
    D = sqrt(U.^2 + V.^2);
end