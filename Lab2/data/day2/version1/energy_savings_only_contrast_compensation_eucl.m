function energy_savings_only_contrast_compensation_eucl(collection_power_savings, collection_distances)

    set(0,'DefaultFigureVisible','off')

    NUM_IMAGES = 220;
    NUM_ITERATIONS = 8;

    Y_power = [];
    Y_distances = [];

    for i_image = 1:NUM_IMAGES

        figure
        for iterations = 2:NUM_ITERATIONS

            Y_power(iterations) = collection_power_savings{iterations}{i_image};
            Y_distances(iterations) = collection_distances{iterations}{i_image};

        end

        x_axis = linspace(15, 11, NUM_ITERATIONS);

        yyaxis left
        b = bar(x_axis, Y_power);
        ylabel('Energy Savings %');

        yyaxis right
        p = plot(x_axis, Y_distances, "-o");
        p.LineWidth = 2;
        ylabel('Euclidean distance %');

        title(['Image #' int2str(i_image) ' - Energy Savings and distorsion with euclidian distance']);

        saveas(gcf, "./results/contrast_compensation/img" + int2str(i_image) + "/" + "energy_vs_eucl.jpg");

    end   
        
        
end
