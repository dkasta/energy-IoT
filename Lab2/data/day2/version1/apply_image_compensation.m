% Image compensation according to mode value:
% BRIGHTNESS_SCALING = 0;
% CONSTRAST_ENHANCEMENT = 1;
% BRIGHTNESS_SCALING_CONSTRAST_ENHANCEMENT = 2;

function image_compensated = apply_image_compensation(img, total_compensation, mode) 

    switch mode
        
        case 0
            
            hsv_img = rgb2hsv(img);
            image_compensated = hsv_img;
            n = size(hsv_img);  

            for i = 1:n(1)
               for j = 1:n(2)
                   image_compensated(i,j,3) = hsv_img(i,j,3) + total_compensation;
                end
            end

            image_compensated = hsv2rgb(image_compensated);
    
        case 1    
      
            hsvImage = rgb2hsv(img);
            hChannel = hsvImage(:, :, 1);
            sChannel = hsvImage(:, :, 2);
            vChannel = hsvImage(:, :, 3);
            meanV = mean2(vChannel);
            newV = meanV + (1.75 - total_compensation) * (vChannel - meanV); % Increase contrast by factor of 1.75
            newHSVImage = cat(3, hChannel, sChannel, newV);

            image_compensated = hsv2rgb(newHSVImage);   
            
       case 2
                     
            hsvImage = rgb2hsv(img);
            hChannel = hsvImage(:, :, 1);
            sChannel = hsvImage(:, :, 2);
            vChannel = hsvImage(:, :, 3);
            meanV = mean2(vChannel);
            newV = meanV + (1.75 - total_compensation) * (vChannel - meanV); % Increase contrast by factor of 1.755
            newHSVImage = cat(3, hChannel, sChannel, newV);

            image_compensated = hsv2rgb(newHSVImage); 
            
            % best 1.5
            additional_brighter_factor = 1.5;
            
            hsv_img = rgb2hsv(img);
            image_compensated = hsv_img;
            n = size(hsv_img);  

            for i = 1:n(1)
               for j = 1:n(2)
                   image_compensated(i,j,3) = hsv_img(i,j,3) + total_compensation * additional_brighter_factor;
                end
            end

            image_compensated = hsv2rgb(image_compensated);
        
    end
         
end
