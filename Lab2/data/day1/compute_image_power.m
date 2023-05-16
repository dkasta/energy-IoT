% Compute power image from RGB image version

function p_image = image_power(img_in) 

    % Constants
    wr = 2.13636845e-7;
    w0 = 1.48169521e-6;
    wg = 1.77746705e-7;
    wb = 2.14348309e-7;
    gamma = 0.7755;
 
    R = [];
    G = [];
    B = [];
    
    % n(1): img width
    % n(2): img heigth
    n = size(img_in);

    p_pixel = [];
    p_image = 0;
    
    sum = 0;
    for i = 1:n(1)
       for j = 1:n(2)
           
            R(i,j) = img_in(i,j,1);
            G(i,j) = img_in(i,j,2);
            B(i,j) = img_in(i,j,3);
            
            p_pixel(i,j) = wr*(R(i,j)^gamma) + wg*(G(i,j)^gamma) + wb*(B(i,j)^gamma);
            
            sum = sum + p_pixel(i, j);
        end
    end
    
    p_image = w0 + sum;
     
end

