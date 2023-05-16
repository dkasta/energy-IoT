function energy_savings_no_compensation_ssim(collection_power_savings, collection_distances)
    set(0,'DefaultFigureVisible','off')


        NUM_IMAGES = 220;
        NUM_ITERATIONS = 8;
        Y_power = [];
        Y_distances = [];      
        Y_distances(1) = 100;

        for i_image = 1:NUM_IMAGES

            figure
            for iterations = 2:NUM_ITERATIONS
                Y_power(iterations) = collection_power_savings{iterations}{i_image};
                Y_distances(iterations) = collection_distances{iterations}{i_image} * 100;

            end

            x_axis = linspace(15, 11, NUM_ITERATIONS);

            yyaxis left
            b = bar(x_axis, Y_power);
            ylabel('Energy Savings %');

            yyaxis right
            p = plot(x_axis, Y_distances, "-o");
            p.LineWidth = 2;


            title('Energy Savings and distorsion with SSIM');
            ylabel('SSIM %');

            saveas(gcf, "./results/no_compensation/img" + int2str(i_image) + "/" + "energy_vs_ssim.jpg");
        
        end 
        
        
end
        