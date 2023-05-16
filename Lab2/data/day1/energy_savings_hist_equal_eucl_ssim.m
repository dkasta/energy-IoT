
function energy_savings_hist_equal_eucl_ssim(collection_power_savings, eucl, ssim, i)

    set(0,'DefaultFigureVisible','off')
    
        Y = [];
        Y_1 = [];
        Y_2 = [];
            Y = collection_power_savings;
            Y_1 = ssim*100;
            Y_2 = eucl;

        figure

        set(gcf,'position',[10, 10, 1800, 800])
        sgtitle('Histogram Equalization: Energy Savings and Similarity');

        subplot(1, 3, 1);
        bar(Y)
        yticks(-160:10:100)
        ylim([-160 100])
        ylabel('Energy savings %');

        subplot(1, 3, 2);
        bar(Y_1)
        yticks(0:10:100)
        ylim([0 100])
        ylabel('Ssim similarity %');

        subplot(1, 3, 3);
        bar(Y_2)
        yticks(0:5:100)
        ylim([0 100])
        ylabel('Euclidean distance diversity %');
        
               
        saveas(gcf, "./results/histogram_equalization/img" + int2str(i) + "/" + "energy_savings_eucl.bmp");
               

end
