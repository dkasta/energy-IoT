function eps = distance(image1, image2)
    
    % Luminance, a and b of the first image
    lum1 = [];
    a1 = [];
    b1 = [];
    
    % Luminance, a and b of the second image
    lum2 = [];
    a2 = [];
    b2 = [];
    
    n = size(image1);
    m = size(image2);

    for i = 1:n(1)
        for j = 1:n(2)
            
            lum1(i,j) = image1(i, j, 1);
            a1(i,j) = image1(i, j, 2);
            b1(i,j) = image1(i, j, 3);
            
        end
    end

    for i = 1:m(1)
        for j = 1:m(2)
            
            lum2(i,j) = image2(i,j,1);
            a2(i,j) = image2(i,j,2);
            b2(i,j) = image2(i,j,3);
            
        end
    end

    % Distortion evaluation by computing euclidean distance
    eps = 0;
    for i = 1:n(1)
        for j = 1:n(2)
            
            eps = eps + sqrt( ( lum1(i, j) - lum2(i, j) )^2 + ( a1(i, j) - a2(i, j) )^2 + ( b1(i, j) - b2(i, j) ) ^2 );
            
        end
    end

end