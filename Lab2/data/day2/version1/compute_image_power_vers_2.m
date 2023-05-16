% Power computation from RGB version of the image according to a power
% model that emphasize I_cell influence

function power_image = compute_image_power_vers_2(img, I_cell, Vdd) 

    p1 = 4.251e-05;
    p2 = -3.029e-04;
    p3 = 3.024e-05;

    n = size(img);  
    power_image = 0;
    sum = 0;
    for i = 1:n(1)
       for j = 1:n(2)
                    
           sum = sum + I_cell(i,j,1) + I_cell(i,j,2) + I_cell(i,j,3);
           
        end
    end
    
    power_image = Vdd * sum;
    
end