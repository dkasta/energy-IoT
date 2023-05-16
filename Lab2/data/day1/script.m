clear all;
close all;

NUM_TOT_IMAGES = 220;
NUM_ITERATIONS = 10;



% Reading images and compute power
for i = 1 : NUM_TOT_IMAGES
            
    % Reading images
    location = "images/image (" + num2str(i) + ").jpg";
    
    mkdir(sprintf('./results/color_reduction/img%i', i));
    mkdir(sprintf('./results/histogram_equalization/img%i', i));
    mkdir(sprintf('./results/luminance_reduction/img%i', i));
    
    original_images{i} = imread(location);
    original_images_lab{i} = rgb2lab(original_images{i});
    
    % Compute image power
    original_power{i} = compute_image_power(original_images{i});
      
end



% Color reduction
for iterations = 1 : NUM_ITERATIONS
            
    for i = 1 : NUM_TOT_IMAGES
                
        img = original_images{i};

        % Apply color reduction (additional 10% each iteration) to RGB channel
        img = color_reduction(img, iterations*10, iterations*10, iterations*10);

        modified_images{i} = img;
        modified_images_lab{i} = rgb2lab(modified_images{i});
        
        % Compute power of the modified image
        modified_power{i} = compute_image_power(img);

        % Compute distorsion between original image and modified image
        % based on euclidean distance and SSIM
        eps{i} = distance(original_images_lab{i}, modified_images_lab{i});
        eucl{i} = evaluate_distorsion_eucl_dist(eps{i}, size(original_images_lab{i}), size(modified_images_lab{i}));
        ssim{i} = evaluate_distorsion_ssim(modified_images{i}, original_images{i});

        % Compute power savings between original image and modified image
        power_saved_originalVSmodified{i} = ((original_power{i} - modified_power{i}) / original_power{i}) * 100;

        % Print original image and modified image in a single picture
        print_color_reduction_originalVSmodified(original_images{i}, modified_images{i}, i, iterations);
        
        power_color_reduction(i, iterations) = power_saved_originalVSmodified{i};
        eucl_dist_color_reduction(i, iterations) =  eucl{i};
        ssim_dist_color_reduction(i, iterations) = ssim{i};

    end
    
    all_color_reduction{iterations} = modified_images;
    all_color_reduction_eucl_dist{iterations} = eucl;
    all_color_reduction_ssim_dist{iterations} = ssim;
    all_color_reduction_power_savings{iterations} = power_saved_originalVSmodified;
        
end

avg_stats_color_reduction(power_color_reduction, eucl_dist_color_reduction, ssim_dist_color_reduction);


% Histogram Equalization
for i = 1 : NUM_TOT_IMAGES
        
    % Convert image from RGB to HSV
    img_HSV = rgb2hsv(original_images{i});
    V_channel = img_HSV(:, :, 3);
    img_histeq = histeq(V_channel);
    HSV_modified = img_HSV;
    HSV_modified(:, :, 3) = img_histeq;
    
    all_histogram_equalized_images{i} = im2uint8(hsv2rgb(HSV_modified));
    modified_images{i} = im2uint8(all_histogram_equalized_images{i});
    
    % Print histogram graph
    print_histogram_graph(original_images{i}, all_histogram_equalized_images{i}, i);

    % Convert image from RGB to LAB
    modified_images_lab{i} = rgb2lab(all_histogram_equalized_images{i});
    
    % Compute power savings between original image and modified image
    modified_power{i} = compute_image_power(all_histogram_equalized_images{i});
    
    power_saved_originalVSmodified{i} = ((original_power{i} - modified_power{i}) / original_power{i}) * 100;
    
    % Compute distorsion between original image and modified image
    % based on euclidean distance and SSIM
    eps{i} = distance(original_images_lab{i}, modified_images_lab{i});
    eucl{i} = evaluate_distorsion_eucl_dist(eps{i}, size(original_images_lab{i}), size(modified_images_lab{i}));
    ssim{i} = evaluate_distorsion_ssim(modified_images{i}, original_images{i});

    all_histogram_equalized_images{i} = modified_images{i};
    all_histogram_equalized_eucl_distances{i} = eucl{i};
    all_histogram_equalized_ssim_distances{i} = ssim{i};
    all_histogram_equalized_power_savings{i} = power_saved_originalVSmodified{i};
    
    energy_savings_hist_equal_eucl_ssim(power_saved_originalVSmodified{i}, eucl{i}, ssim{i}, i);

end


% Luminance reduction
for iteration = 1:NUM_ITERATIONS
    
    for i = 1 : NUM_TOT_IMAGES
        
        % Convert image from RGB to HSV
        HSV_img = rgb2hsv(original_images{i});
        
        % Apply luminance reduction (additional 10% each iteration) to HSV image version
        modified_images{i} = compute_luminance_reduction(HSV_img, iteration*10);
        modified_images{i} = im2uint8(hsv2rgb(modified_images{i}));
            
        % Convert image from RGB to LAB
        modified_images_lab{i} = rgb2lab(modified_images{i});

        % Compute power savings between original image and modified image
        modified_power{i} = compute_image_power(modified_images{i});
        power_saved_originalVSmodified{i} = ((original_power{i} - modified_power{i}) / original_power{i}) * 100;

        % Compute distorsion between original image and modified image
        % based on euclidean distance and SSIM
        eps{i} = distance(original_images_lab{i}, modified_images_lab{i});
        eucl{i} = evaluate_distorsion_eucl_dist(eps{i}, size(original_images_lab{i}), size(modified_images_lab{i}));
        ssim{i} = evaluate_distorsion_ssim(modified_images{i}, original_images{i});
        
        % Print original image and modified image in a single picture
        print_luminance_reduction_originalVSmodified(original_images{i}, modified_images{i}, i, iteration);
        
        
        power_luminance_reduction(i, iteration) = power_saved_originalVSmodified{i};
        eucl_dist_luminance_reduction(i, iteration) =  eucl{i};
        ssim_dist_luminance_reduction(i, iteration) = ssim{i};
        
       
   end
    
    all_luminance_reduction_images{iteration} = modified_images;
    all_luminance_reduction_images_eucl_distances{iteration} = eucl;
    all_luminance_reduction_images_ssim_distances{iteration} = ssim;
    all_luminance_reduction_images_power_savings{iteration} = power_saved_originalVSmodified;
    
end

avg_stats_luminance_reduction(power_luminance_reduction, eucl_dist_luminance_reduction, ssim_dist_luminance_reduction);

    
% SSIM color reduction
energy_savings_color_reduction_ssim(all_color_reduction_power_savings, all_color_reduction_ssim_dist);
% Euclidean distance color reduction
energy_savings_color_reduction_eucl(all_color_reduction_power_savings, all_color_reduction_eucl_dist);
% Global energy savings histogram equalization
energy_savings_hist_equal_global(all_histogram_equalized_power_savings, all_histogram_equalized_eucl_distances, all_histogram_equalized_ssim_distances, 0);
% SSIM luminance reduction
energy_savings_luminance_reduction_ssim(all_luminance_reduction_images_power_savings, all_luminance_reduction_images_eucl_distances);
% Euclidean distance luminance reduction
energy_savings_luminance_reduction_eucl(all_luminance_reduction_images_power_savings, all_luminance_reduction_images_ssim_distances);



%%%%%% Further statistics on my images %%%%%%
clear all;
close all;

NUM_MY_IMAGES = 6;
NUM_ITERATIONS = 10;

% Reading images and compute power
for i = 1 : NUM_MY_IMAGES
                
    % Reading images
    location = "images/image (" + num2str(i+214) + ").jpg";
        
    original_images{i} = imread(location);
    original_images_lab{i} = rgb2lab(original_images{i});
    
    % Compute image power
    original_power{i} = compute_image_power(original_images{i});
      
end

% Color reduction
for iterations = 1 : NUM_ITERATIONS
                
    for i = 1 : NUM_MY_IMAGES
                                
        img = original_images{i};

        % Apply color reduction (additional 10% each iteration) to RGB channel
        img = color_reduction(img, iterations*10, iterations*10, iterations*10);

        modified_images{i} = img;
        modified_images_lab{i} = rgb2lab(modified_images{i});
        
        % Compute power of the modified image
        modified_power{i} = compute_image_power(img);

        % Compute power savings between original image and modified image
        power_saved_originalVSmodified{i} = ((original_power{i} - modified_power{i}) / original_power{i}) * 100;

    end
    
    all_color_reduction_power_savings{iterations} = power_saved_originalVSmodified;
        
end


% Histogram Equalization
for i = 1 : NUM_MY_IMAGES
   
    % Convert image from RGB to HSV
    img_HSV = rgb2hsv(original_images{i});
    V_channel = img_HSV(:, :, 3);
    img_histeq = histeq(V_channel);
    HSV_modified = img_HSV;
    HSV_modified(:, :, 3) = img_histeq;
    
    all_histogram_equalized_images{i} = im2uint8(hsv2rgb(HSV_modified));
    modified_images{i} = im2uint8(all_histogram_equalized_images{i});
    
    % Convert image from RGB to LAB
    modified_images_lab{i} = rgb2lab(all_histogram_equalized_images{i});
    
    % Compute power savings between original image and modified image
    modified_power{i} = compute_image_power(all_histogram_equalized_images{i});
    
    power_saved_originalVSmodified{i} = ((original_power{i} - modified_power{i}) / original_power{i}) * 100;
    
    % Compute distorsion between original image and modified image
    % based on euclidean distance and SSIM
    eps{i} = distance(original_images_lab{i}, modified_images_lab{i});
    eucl{i} = evaluate_distorsion_eucl_dist(eps{i}, size(original_images_lab{i}), size(modified_images_lab{i}));
    ssim{i} = evaluate_distorsion_ssim(modified_images{i}, original_images{i});

    all_histogram_equalized_images{i} = modified_images{i};
    all_histogram_equalized_eucl_distances{i} = eucl{i};
    all_histogram_equalized_ssim_distances{i} = ssim{i};
    all_histogram_equalized_power_savings{i} = power_saved_originalVSmodified{i};
   
end


% Luminance reduction
for iteration = 1:NUM_ITERATIONS
    
    iteration
    
    for i = 1 : NUM_MY_IMAGES
        
        i
        
        % Convert image from RGB to HSV
        HSV_img = rgb2hsv(original_images{i});
        
        % Apply luminance reduction (additional 10% each iteration) to HSV image version
        modified_images{i} = compute_luminance_reduction(HSV_img, iteration*10);
        modified_images{i} = im2uint8(hsv2rgb(modified_images{i}));
            
        % Convert image from RGB to LAB
        modified_images_lab{i} = rgb2lab(modified_images{i});

        % Compute power savings between original image and modified image
        modified_power{i} = compute_image_power(modified_images{i});
        power_saved_originalVSmodified{i} = ((original_power{i} - modified_power{i}) / original_power{i}) * 100;
             
    end
    
    all_luminance_reduction_images_power_savings{iteration} = power_saved_originalVSmodified;
    
end

% Global energy stats on my images
my_images_energy_savings_color_reduction(all_color_reduction_power_savings);
energy_savings_hist_equal_global(all_histogram_equalized_power_savings, all_histogram_equalized_eucl_distances, all_histogram_equalized_ssim_distances, 1);
my_images_energy_savings_luminance_reduction(all_luminance_reduction_images_power_savings);





