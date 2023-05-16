function eps = distance(img1, img2)
        
    n = size(img1);
    m = size(img2);

    for i = 1:n(1)
        for j = 1:n(2)
            
            a1(i,j) = img1(i, j, 1);
            b1(i,j) = img1(i, j, 2);
            c1(i,j) = img1(i, j, 3);
            
        end
    end

    for i = 1:m(1)
        for j = 1:m(2)
            
            a2(i,j) = img2(i,j,1);
            b2(i,j) = img2(i,j,2);
            c2(i,j) = img2(i,j,3);
            
        end
    end

    % Euclidean distance for distorsion
    eps = 0;
    for i = 1:n(1)
        for j = 1:n(2)
            
            eps = eps + sqrt((a1(i,j) - a2(i,j))^2 + (b1(i,j) - b2(i,j))^2 + (c1(i,j) - c2(i,j))^2);
            
        end
    end

end