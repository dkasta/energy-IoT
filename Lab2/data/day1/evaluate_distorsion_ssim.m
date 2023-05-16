% Compute distortion using SSIM

function perc = evaluate_distorsion_ssim(modified_images, original_images)
    
    perc = ssim(uint8(modified_images), original_images);

end