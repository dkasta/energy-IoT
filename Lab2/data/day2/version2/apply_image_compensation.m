% Image compensation according to mode value:
% BRIGHTNESS_SCALING = 0;
% CONSTRAST_ENHANCEMENT = 1;
% BRIGHTNESS_SCALING_CONSTRAST_ENHANCEMENT = 2;

function image_compensated = apply_image_compensation(img, new_Vdd, mode) 

    Vdd = 15;

    switch mode
        
        case 0
            
            hsv_img = rgb2hsv(img);
            image_compensated = hsv_img;
            n = size(hsv_img); 
            
            V = hsv_img(:,:,3);
            
            b = (Vdd - new_Vdd) / Vdd ;

            for i = 1:n(1)
               for j = 1:n(2)
                   image_compensated(i,j,3) = min(1 , V(i,j) + b);
                end
            end

            image_compensated = hsv2rgb(image_compensated);
            
            
        case 1
                     
            hsv_img = rgb2hsv(img);
            image_compensated = hsv_img;
            b = Vdd / new_Vdd;
            
            V = hsv_img(:,:,3);
            n = size(V);
            
            for i = 1:n(1)
               for j = 1:n(2)
                   image_compensated(i,j,3) = min(1 , V(i,j) / b);
                end
            end

            image_compensated = hsv2rgb(image_compensated);
            
            
        case 2
           
            hsv_img = rgb2hsv(img);
            image_compensated = hsv_img;
            V = hsv_img(:,:,3);
            n = size(V);
            
            lower_bound = (Vdd - new_Vdd) / Vdd;
            upper_bound = new_Vdd / Vdd;
            
            b = Vdd / new_Vdd;
            c = 1 / (upper_bound - lower_bound);
            d = - lower_bound / (upper_bound - lower_bound);

            for i = 1:n(1)
               for j = 1:n(2)
                   
                    if (V(i,j) >= 0 && V(i,j) < lower_bound)
                        
                        image_compensated(i,j,3) = 0;
                        
                    elseif (V(i,j) >= lower_bound && V(i,j) <= upper_bound)
                        
                        image_compensated(i,j,3) = c * V(i,j) + d;
                        
                    else
                        
                        image_compensated(i,j,3) = 1;
                    end  
                    
                end
            end

            image_compensated = hsv2rgb(image_compensated);
                             
    end
         
end
