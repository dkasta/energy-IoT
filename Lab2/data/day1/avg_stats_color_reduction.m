function avg_stats_color_reduction(power, eucl_dist, ssim_dist)
    
        set(0,'DefaultFigureVisible','off')
        
        NUM_IMAGES = 220;
        NUM_ITERATIONS = 10;
        
        for i = 1:NUM_ITERATIONS
            Y(i) = (sum(power(:, i))) / NUM_IMAGES;
            Y_1(i) = (sum(ssim_dist(:, i)) * 100) / NUM_IMAGES;
            Y_2(i) = (sum(eucl_dist(:, i))) / NUM_IMAGES;

        end

        figure
        bar(Y);

        set(gcf,'position',[10, 10, 1800, 800])
        sgtitle('Color Reduction: Energy Savings and Similarity');

        subplot(1, 3, 1);
        bar(Y)

        xlabel('Color reduction %');
        ylabel('Energy savings %');

        subplot(1, 3, 2);
        bar(Y_1)
        xlabel('Color reduction %');
        ylabel('Ssim similarity %');

        subplot(1, 3, 3);
        bar(Y_2)
        xlabel('Color reduction %');
        ylabel('Euclidean distance diversity %');


        saveas(gcf, "./results/color_reduction/global_stats.jpg");


end