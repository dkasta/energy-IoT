% Apply luminance reduction (additional 10% each iteration) to RGB channel
% (img_in is in HSV space)

function img_out = compute_luminance_reduction(img_in, factor)

    reduce = factor / 100;
    img_out = img_in;
    img_out(:, :, 3) = img_in(:, :, 3) - reduce;
    
end