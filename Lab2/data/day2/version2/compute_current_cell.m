% Power computation from RGB version of the image

function I_cell = compute_current_cell(img, Vdd) 

    p1 = 4.251e-05;
    p2 = -3.029e-04;
    p3 = 3.024e-05;

    n = size(img);  
    for i = 1:n(1)
       for j = 1:n(2)
           
           R(i,j) = double(img(i,j,1));
           G(i,j) = double(img(i,j,2));
           B(i,j) = double(img(i,j,3));

           I_cell(i,j,1) = (p1 * Vdd * R(i,j)) / (255) + (p2 * R(i,j)) / (255) + p3;
           I_cell(i,j,2) = (p1 * Vdd * G(i,j)) / (255) + (p2 * G(i,j)) / (255) + p3;
           I_cell(i,j,3) = (p1 * Vdd * B(i,j)) / (255) + (p2 * B(i,j)) / (255) + p3;
                     
        end
    end
    
end