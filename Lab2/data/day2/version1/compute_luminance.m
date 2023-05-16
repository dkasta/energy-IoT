%Compute luminance of an image
function luminance = compute_luminance(img)
    
    hsv_img = rgb2hsv(img);

    luminance = mean2(hsv_img(:,:,3));

end