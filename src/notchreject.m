function out = notchreject(imgf, notches)
    out = imgf;
    n = size(notches,3);
    for k = 1:n
        for i = notches(1,1,k):notches(1,2,k)
            for j = notches(2,1,k):notches(2,2,k)
                out(j, i) = 0;
            end
        end
    end
end