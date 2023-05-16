function print_originalVSmodified(original_image, modified_image, index, iteration, vector_Vdd, mode)

    if (mode == 0)
        figure
        set(gcf,'visible','off')
        subplot(1, 2, 1), imshow(original_image)
        subplot(1, 2, 2), imshow(modified_image)
        sgtitle("Image #" + int2str(index) + ", DVS without compensation Vdd = " + num2str(vector_Vdd(iteration)));

        saveas(gcf, "./results/no_compensation/img" + int2str(index) + "/" + num2str(iteration) + "_iteration_Vdd = " + num2str(vector_Vdd(iteration)) + ".jpg");
    end
    
    if (mode == 1)
        figure
        set(gcf,'visible','off')
        subplot(1, 2, 1), imshow(original_image)
        subplot(1, 2, 2), imshow(modified_image)
        sgtitle("Image #" + int2str(index) + ", DVS with brightness compensation Vdd = " + num2str(vector_Vdd(iteration)));

        saveas(gcf, "./results/brightness_compensation/img" + int2str(index) + "/" + num2str(iteration) + "_iteration_Vdd = " + num2str(vector_Vdd(iteration)) + ".jpg");
    end
    
    if (mode == 2)
        figure
        set(gcf,'visible','off')
        subplot(1, 2, 1), imshow(original_image)
        subplot(1, 2, 2), imshow(modified_image)
        sgtitle("Image #" + int2str(index) + ", DVS with contrast compensation Vdd = " + num2str(vector_Vdd(iteration)));

        saveas(gcf, "./results/contrast_compensation/img" + int2str(index) + "/" + num2str(iteration) + "_iteration_Vdd = " + num2str(vector_Vdd(iteration)) + ".jpg");
    end
    
    if (mode == 3)
        figure
        set(gcf,'visible','off')
        subplot(1, 2, 1), imshow(original_image)
        subplot(1, 2, 2), imshow(modified_image)
        sgtitle("Image #" + int2str(index) + ", DVS with bright. and contr. comp. Vdd = " + num2str(vector_Vdd(iteration)));

        saveas(gcf, "./results/brigntess_and_contrast_compensation/img" + int2str(index) + "/" + num2str(iteration) + "_iteration_Vdd = " + num2str(vector_Vdd(iteration)) + ".jpg");
    end 
    
    
    
end