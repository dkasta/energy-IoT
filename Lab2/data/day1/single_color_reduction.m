% Apply color reduction applied to a single channel

function img_out = single_color_reduction(img_in, perc_reduction, channel)

    n = size(img_in);
    img_out = img_in;
    
    reduction = (perc_reduction * 255) / 100;  
    
    for i = 1:n(1)
        for j = 1:n(2)
            img_out(i, j, channel) = img_in(i, j, channel) - reduction;
        end
    end
end