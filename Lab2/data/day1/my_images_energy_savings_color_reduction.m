function my_images_energy_savings_color_reduction(collection_power_savings)

    set(0,'DefaultFigureVisible','off')
    
    NUM_IMAGES = 6;
        
    Y = [];
    x_axis = linspace(1, NUM_IMAGES, NUM_IMAGES);
    
    figure
    for iterations = 1:10

        for i = 1:NUM_IMAGES
            Y(i) = collection_power_savings{iterations}{i};
        end

        hold on
        plot(x_axis, Y, '-o', 'DisplayName', int2str(iterations*10) + "%")
        xticks(1:1:NUM_IMAGES)
        xlim([1 NUM_IMAGES])
        
        title('Energy savings w.r.t color reduction ');
        xlabel('Image #');
        ylabel('Energy savings %');
        lgd = legend;
        lgd.Title.String = "Color reduction %";
        lgd.Location = "bestoutside";

        hold off
    end
    
    saveas(gcf, "./results/color_reduction/my_images_stats.bmp");

end