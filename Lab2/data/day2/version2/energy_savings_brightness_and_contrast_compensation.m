function energy_savings_brightness_and_contrast_compensation(collection_power_savings, original_power, vector_Vdd)

    set(0,'DefaultFigureVisible','off')

    NUM_IMAGES = 220;   
    NUM_ITERATIONS = 8;

    for iterations = 1:NUM_ITERATIONS
        for i = 1:NUM_IMAGES
            if (iterations == 1)
                Y(i, 1) = original_power{i};
            else
                Y(i,iterations) = collection_power_savings{iterations}{i};
            end
            
        end
    end
    

    for i = 1:NUM_IMAGES
        figure 
        plot(vector_Vdd, Y(i,:), '-o');
        title('Energy savings w.r.t different voltage scaling');
        xlabel('Vdd values (V)');
        ylabel('Energy consumption (microJ)');
        grid on
        saveas(gcf, "./results/brigntess_and_contrast_compensation/img" + num2str(i) + "/" + "energy_vs_Vdd_scaling.jpg");
    end       
             
             
end