clear all
close all

NUM_IMAGES = 220;
NUM_ITERATIONS = 8;
SATURATED  = 1;
vector_Vdd = [15:-0.5:11.5]; % 8 iterations
defaul_Vdd = 15;

% Reading images, compute power and current flowing in each cell
for i = 1 : NUM_IMAGES
        
    % Reading images
    location = "images/image (" + num2str(i) + ").jpg";
    
    mkdir(sprintf('./results/no_compensation/img%i', i));
    mkdir(sprintf('./results/brightness_compensation/img%i', i));  
    mkdir(sprintf('./results/contrast_compensation/img%i', i));
    mkdir(sprintf('./results/brigntess_and_contrast_compensation/img%i', i));
    
    original_images{i} = imread(location);
    original_images_lab{i} = rgb2lab(original_images{i});
    
    I_cell{i} = compute_current_cell(original_images{i}, defaul_Vdd);
    original_power{i} = compute_image_power_vers_2(original_images{i}, I_cell{i}, defaul_Vdd);
    
end

% Given, the defined vector_Vdd, the DVS is applied for Vdd values that
% belong to the range [15-11.5]
for iterations = 1 : NUM_ITERATIONS
                
    for i = 1 : NUM_IMAGES
        
        img = original_images{i};
        
        % DVS image without compensation
        first_DVS_img{i} = displayed_image(I_cell{i}, vector_Vdd(iterations), SATURATED);
        I_cell_first_DVS{i} = compute_current_cell(first_DVS_img{i}*255, vector_Vdd(iterations));
        modified_power_first_DVS{i} = compute_image_power_vers_2(first_DVS_img{i}*255, I_cell_first_DVS{i}, vector_Vdd(iterations));
        luminance_loss{i} = compute_luminance_loss(original_images{i}, first_DVS_img{i});

        
        % DVS image with brightness compensation
        brighter_original_image{i} = apply_image_compensation(original_images{i}, vector_Vdd(iterations), 0);
        I_cell_brighter{i} = compute_current_cell(brighter_original_image{i}*255, vector_Vdd(iterations));
        second_DVS_img{i} = displayed_image(I_cell_brighter{i}, vector_Vdd(iterations), SATURATED);    
        modified_power_second_DVS{i} = compute_image_power_vers_2(second_DVS_img{i}, I_cell_brighter{i}, vector_Vdd(iterations));
       

        % DVS image with contrast compensation
        higher_contrast_original_image{i} = apply_image_compensation(original_images{i}, vector_Vdd(iterations), 1);
        I_cell_higher_contrast{i} = compute_current_cell(higher_contrast_original_image{i}*255, vector_Vdd(iterations));
        third_DVS_img{i} = displayed_image(I_cell_higher_contrast{i}, vector_Vdd(iterations), SATURATED);      
        modified_power_third_DVS{i} = compute_image_power_vers_2(third_DVS_img{i}, I_cell_higher_contrast{i}, vector_Vdd(iterations));

 
        % DVS image with brightness and contrast compensations
        higher_contrast_brightness_original_image{i} = apply_image_compensation(original_images{i}, vector_Vdd(iterations), 2);
        I_cell_higher_contrast_brightness{i} = compute_current_cell(higher_contrast_brightness_original_image{i}*255, vector_Vdd(iterations));
        fourth_DVS_img{i} = displayed_image(I_cell_higher_contrast_brightness{i}, vector_Vdd(iterations), SATURATED);      
        modified_power_fourth_DVS{i} = compute_image_power_vers_2(fourth_DVS_img{i}, I_cell_higher_contrast_brightness{i}, vector_Vdd(iterations));
             
        
        % Distortion and Power savings computations
        % Without compensations
        first_DVS_image_lab{i} = rgb2lab(first_DVS_img{i});
        eps_1{i} = distance(original_images_lab{i}, first_DVS_image_lab{i});
        eucl_1{i} = evaluate_distorsion_eucl_dist(eps_1{i}, size(original_images_lab{i}), size(first_DVS_image_lab{i}));
        ssim_1{i} = evaluate_distorsion_ssim(first_DVS_img{i}*255, original_images{i});
        print_originalVSmodified(original_images{i}, first_DVS_img{i}, i, iterations, vector_Vdd, 0);
        
        
        % Brightness compensation
        second_DVS_image_lab{i} = rgb2lab(second_DVS_img{i});
        eps_2{i} = distance(original_images_lab{i}, second_DVS_image_lab{i});
        eucl_2{i} = evaluate_distorsion_eucl_dist(eps_2{i}, size(original_images_lab{i}), size(second_DVS_image_lab{i}));
        ssim_2{i} = evaluate_distorsion_ssim(second_DVS_img{i}*255, original_images{i});
        print_originalVSmodified(original_images{i}, second_DVS_img{i}, i, iterations, vector_Vdd, 1);

        % Contrast compensation
        third_DVS_image_lab{i} = rgb2lab(third_DVS_img{i});
        eps_3{i} = distance(original_images_lab{i}, third_DVS_image_lab{i});
        eucl_3{i} = evaluate_distorsion_eucl_dist(eps_3{i}, size(original_images_lab{i}), size(third_DVS_image_lab{i}));
        ssim_3{i} = evaluate_distorsion_ssim(third_DVS_img{i}*255, original_images{i});
        print_originalVSmodified(original_images{i}, third_DVS_img{i}, i, iterations, vector_Vdd, 2);
    
        % Brighntess and contrast compensations
        fourth_DVS_image_lab{i} = rgb2lab(fourth_DVS_img{i});
        eps_4{i} = distance(original_images_lab{i}, fourth_DVS_image_lab{i});
        eucl_4{i} = evaluate_distorsion_eucl_dist(eps_4{i}, size(original_images_lab{i}), size(fourth_DVS_image_lab{i}));
        ssim_4{i} = evaluate_distorsion_ssim(fourth_DVS_img{i}*255, original_images{i});
        print_originalVSmodified(original_images{i}, fourth_DVS_img{i}, i, iterations, vector_Vdd, 3);
                
        % Compute power and distorsions according to compensation type
        
        power_no_compensation(i, iterations) = modified_power_first_DVS{i};
        eucl_dist_no_compensation(i, iterations) = eucl_1{i};
        ssim_dist_no_compensation(i, iterations) = ssim_1{i}; 

        power_only_brightness_compensation(i, iterations) = modified_power_second_DVS{i};
        eucl_dist_only_brightness_compensation(i, iterations) = eucl_2{i};
        ssim_dist_only_brightness_compensation(i, iterations) = ssim_2{i}; 

        power_only_contrast_compensation(i, iterations) = modified_power_third_DVS{i};
        eucl_dist_only_contrast_compensation(i, iterations) =  eucl_3{i};
        ssim_dist_only_contrast_compensation(i, iterations) = ssim_3{i}; 
        
        power_bright_and_contr_compensation(i, iterations) = modified_power_fourth_DVS{i};
        eucl_dist_bright_and_contr_compensation(i, iterations) = eucl_4{i};
        ssim_dist_bright_and_contr_compensation(i, iterations) = ssim_4{i}; 
          
    end
    
    % Collections that gather all power and distorsion stats of all the images
    
    all_no_compensation_eucl_dist_1{iterations} = eucl_1;
    all_no_compensation_ssim_dist_1{iterations} = ssim_1;
    all_no_compensation_power{iterations} = modified_power_first_DVS;    

    all_brightness_compensation_eucl_dist_2{iterations} = eucl_2;
    all_brightness_compensation_ssim_dist_2{iterations} = ssim_2;
    all_brightness_compensation_power{iterations} = modified_power_second_DVS; 

    all_contrast_compensation_eucl_dist_3{iterations} = eucl_3;
    all_contrast_compensation_ssim_dist_3{iterations} = ssim_3;
    all_contrast_compensation_power{iterations} = modified_power_third_DVS; 

    all_brightness_and_contrast_compensation_eucl_dist_4{iterations} = eucl_4;
    all_brightness_and_contrast_compensation_ssim_dist_4{iterations} = ssim_4;
    all_brightness_and_contrast_compensation_power{iterations} = modified_power_fourth_DVS;
     
end

all_perc_power_no_compensation = compute_perc_power_V2(power_no_compensation, original_power);
all_perc_power_brightness_compensation = compute_perc_power_V2(power_only_brightness_compensation, original_power);
all_perc_power_contrast_compensation = compute_perc_power_V2(power_only_contrast_compensation, original_power);
all_perc_power_brightness_and_contrast_compensation = compute_perc_power_V2(power_bright_and_contr_compensation, original_power);


% Global statistics
avg_stats(all_perc_power_no_compensation, eucl_dist_no_compensation, ssim_dist_no_compensation, 0)
avg_stats(all_perc_power_brightness_compensation, eucl_dist_only_brightness_compensation, ssim_dist_only_brightness_compensation, 1);
avg_stats(all_perc_power_contrast_compensation, eucl_dist_only_contrast_compensation, ssim_dist_only_contrast_compensation, 2)
avg_stats(all_perc_power_brightness_and_contrast_compensation, eucl_dist_bright_and_contr_compensation, ssim_dist_bright_and_contr_compensation, 3)


% For no compensated images
all_perc_power_no_compensation = compute_perc_power(all_no_compensation_power, original_power);
energy_savings_no_compensation(all_no_compensation_power, original_power, vector_Vdd);
energy_savings_no_compensation_ssim(all_perc_power_no_compensation, all_no_compensation_ssim_dist_1);
energy_savings_no_compensation_eucl(all_perc_power_no_compensation, all_no_compensation_eucl_dist_1);


% Only for brightness compensation
all_perc_power_brightness_compensation = compute_perc_power(all_brightness_compensation_power, original_power);
energy_savings_only_brightness_compensation(all_brightness_compensation_power, original_power, vector_Vdd);
energy_savings_only_brightness_compensation_ssim(all_perc_power_brightness_compensation, all_brightness_compensation_ssim_dist_2);
energy_savings_only_brightness_compensation_eucl(all_perc_power_brightness_compensation, all_brightness_compensation_eucl_dist_2);


% Only for contrast compensation
all_perc_power_contrast_compensation = compute_perc_power(all_contrast_compensation_power, original_power);
energy_savings_only_contrast_compensation(all_contrast_compensation_power, original_power, vector_Vdd);
energy_savings_only_contrast_compensation_ssim(all_perc_power_contrast_compensation, all_contrast_compensation_ssim_dist_3);
energy_savings_only_contrast_compensation_eucl(all_perc_power_contrast_compensation, all_contrast_compensation_eucl_dist_3);

% Both brigthness and contrast compensations
all_perc_power_brightness_and_contrast_compensation = compute_perc_power(all_brightness_and_contrast_compensation_power, original_power);
energy_savings_brightness_and_contrast_compensation(all_brightness_and_contrast_compensation_power, original_power, vector_Vdd);
energy_savings_brightness_and_contrast_compensation_ssim(all_perc_power_brightness_and_contrast_compensation, all_brightness_and_contrast_compensation_ssim_dist_4);
energy_savings_brightness_and_contrast_compensation_eucl(all_perc_power_brightness_and_contrast_compensation, all_brightness_and_contrast_compensation_eucl_dist_4);




