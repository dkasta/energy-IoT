% Apply color reduction applied separately to each RGB channel

function img_out = color_reduction(img_in, redR, redG, redB)
         
    img_in = single_color_reduction(img_in, redR, 1);
    img_in = single_color_reduction(img_in, redG, 2);
    img_in = single_color_reduction(img_in, redB, 3);
    
    img_out = img_in;

end