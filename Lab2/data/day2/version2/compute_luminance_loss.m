%Compute luminance loss between two images
function luminance_loss = compute_luminance_loss(img1, img2)


    luminance1 = compute_luminance(img1);   
    luminance2 = compute_luminance(img2);


    luminance_loss = luminance1 - luminance2;


end
