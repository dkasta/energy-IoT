function energy_savings_hist_equal(collection_power_savings, eucl, ssim, mode)

    set(0,'DefaultFigureVisible','off')
    
    if (mode == 0)
        
        NUM_IMAGES = 220;
    
    x_axis = linspace(1, NUM_IMAGES, NUM_IMAGES);
        Y = [];
        Y_1 = [];
        Y_2 = [];
        for i = 1:NUM_IMAGES
            Y(i) = collection_power_savings{i};
            Y_1(i) = ssim{i}*100;
            Y_2(i) = eucl{i};
        end

        figure

        set(gcf,'position',[10, 10, 1800, 800])
        sgtitle('Histogram Equalization: Energy Savings and Similarity');

        subplot(1, 3, 1);
        bar(x_axis, Y)
        xticks(1:1:NUM_IMAGES)
        yticks(-160:10:100)

        ylim([-160 100])

        xlabel('Image #');
        ylabel('Energy savings %');


        subplot(1, 3, 2);
        bar(x_axis, Y_1)
        yticks(0:10:100)
        ylim([0 100])
        xlabel('Image #');
        ylabel('Ssim similarity %');

        subplot(1, 3, 3);
        bar(x_axis, Y_2)
        yticks(0:5:100)
        ylim([0 100])
        xlabel('Image #');
        ylabel('Euclidean distance diversity %');

        saveas(gcf, "./results/histogram_equalization/global_energy_savings.bmp");
        
    else
        
        NUM_IMAGES = 6;
        
        
            x_axis = linspace(1, NUM_IMAGES, NUM_IMAGES);
        Y = [];
        Y_1 = [];
        Y_2 = [];
        for i = 1:NUM_IMAGES
            Y(i) = collection_power_savings{i};
            Y_1(i) = ssim{i}*100;
            Y_2(i) = eucl{i};
        end

        figure

        set(gcf,'position',[10, 10, 1800, 800])
        sgtitle('Histogram Equalization: Energy Savings and Similarity');

        subplot(1, 3, 1);
        bar(x_axis, Y)
        xticks(1:1:NUM_IMAGES)
        yticks(-160:10:100)

        ylim([-160 100])

        xlabel('Image #');
        ylabel('Energy savings %');


        subplot(1, 3, 2);
        bar(x_axis, Y_1)
        yticks(0:10:100)
        ylim([0 100])
        xlabel('Image #');
        ylabel('Ssim similarity %');

        subplot(1, 3, 3);
        bar(x_axis, Y_2)
        yticks(0:5:100)
        ylim([0 100])
        xlabel('Image #');
        ylabel('Euclidean distance diversity %');

        saveas(gcf, "./results/histogram_equalization/my_images_stats.bmp");
        
    end
            
end


