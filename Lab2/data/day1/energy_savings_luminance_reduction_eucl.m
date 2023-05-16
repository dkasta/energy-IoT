function energy_savings_luminance_reduction_eucl(collection_power_savings, collection_distances)

    set(0,'DefaultFigureVisible','off')


        NUM_IMAGES = 220;
    
        Y_power = [];
        Y_distances = [];

        for i_image = 1:NUM_IMAGES

            figure
            for i_perc = 1:10
                Y_power(i_perc) = collection_power_savings{i_perc}{i_image};
                Y_distances(i_perc) = collection_distances{i_perc}{i_image}*100;
            end

            x_axis = linspace(10, 100, 10);

            yyaxis left
            b = bar(x_axis, Y_power);

            ylabel('Energy savings %');
            ylim([0 100])

            yyaxis right
            p = plot(x_axis, Y_distances, "-o");
            p.LineWidth = 2;

            ylim([0 100])

            title('Energy savings w.r.t luminance reductions');
            xlabel('Luminance reduction %');
            ylabel('SSIM similarity %');
       
        
            saveas(gcf, "./results/luminance_reduction/img" + int2str(i_image) + "/" + "energy_savings_eucl.bmp");
                
        end 


end