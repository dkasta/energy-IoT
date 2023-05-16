%Compute average statistics for:
% no compensations
% brighntess compensation
% contrast compensation
% brigthness and contrast compensations
% according to mode value 

function avg_stats(power, eucl, ssim, mode)

        set(0,'DefaultFigureVisible','off')
        
        NUM_IMAGES = 220;
        NUM_ITERATIONS = 8;
        vector_Vdd = [15:-0.5:11.5]; % 8 iterations
        
        for i = 1:NUM_ITERATIONS
            Y(i) = (sum(power(:, i))) / NUM_IMAGES;
            Y_1(i) = (sum(eucl(:, i))) / NUM_IMAGES;
            Y_2(i) = (sum(ssim(:, i))) / NUM_IMAGES;
        end
        
        Y_2 = Y_2 * 100;


    if (mode == 0)
        
        figure

        set(gcf,'position',[10, 10, 1800, 800])
        sgtitle('Voltage scaling without compensation: Energy Savings and Similarity');

        subplot(1, 3, 1);
        bar(vector_Vdd, Y);
        set(gca, 'XDir','reverse')
        
        xlabel('Vdd scaling');
        ylabel('Energy savings %');

        subplot(1, 3, 2);
        bar(vector_Vdd, Y_2);
        set(gca, 'XDir','reverse')

        xlabel('Vdd scaling');
        ylabel('Ssim similarity %');

        subplot(1, 3, 3);
        bar(vector_Vdd, Y_1);
        set(gca, 'XDir','reverse')

        xlabel('Vdd scaling %');
        ylabel('Euclidean distance diversity %');
    
        saveas(gcf, "./results/no_compensation/global_stats.jpg");

    elseif (mode == 1)
            
        figure
        bar(vector_Vdd, Y);
        set(gca, 'XDir','reverse')

        set(gcf,'position',[10, 10, 1800, 800])
        sgtitle('Voltage scaling with brightness compensation: Energy Savings and Similarity');

        subplot(1, 3, 1);
        bar(vector_Vdd, Y);
        set(gca, 'XDir','reverse')
        
        xlabel('Vdd scaling');
        ylabel('Energy savings %');

        subplot(1, 3, 2);
        bar(vector_Vdd, Y_2);
        set(gca, 'XDir','reverse')

        xlabel('Vdd scaling');
        ylabel('Ssim similarity %');

        subplot(1, 3, 3);
        bar(vector_Vdd, Y_1);
        set(gca, 'XDir','reverse')

        xlabel('Vdd scaling');
        ylabel('Euclidean distance diversity %');

        saveas(gcf, "./results/brightness_compensation/global_stats.jpg");

    elseif(mode == 2)
        
        Y(:, 1) = 0;
        Y_1(:, 1) = 0;
        
        
        figure
        set(gcf,'position',[10, 10, 1800, 800])
        sgtitle('Voltage scaling with contrast compensation: Energy Savings and Similarity');

        subplot(1, 3, 1);
        bar(vector_Vdd, Y);
        set(gca, 'XDir','reverse')
        
        xlabel('Vdd scaling');
        ylabel('Energy savings %');

        subplot(1, 3, 2);
        bar(vector_Vdd, Y_2);
        set(gca, 'XDir','reverse')

        xlabel('Vdd scaling');
        ylabel('Ssim similarity %');

        subplot(1, 3, 3);
        bar(vector_Vdd, Y_1);
        set(gca, 'XDir','reverse')

        xlabel('Vdd scaling');
        ylabel('Euclidean distance diversity %');

        saveas(gcf, "./results/contrast_compensation/global_stats.jpg");

    else
        
        figure

        set(gcf,'position',[10, 10, 1800, 800])
        sgtitle('Voltage scaling with brightness and contrast compensations: Energy Savings and Similarity');

        subplot(1, 3, 1);
        bar(vector_Vdd, Y);
        set(gca, 'XDir','reverse')
        
        xlabel('Vdd scaling');
        ylabel('Energy savings %');

        subplot(1, 3, 2);
        bar(vector_Vdd, Y_2);
        set(gca, 'XDir','reverse')

        xlabel('Vdd scaling');
        ylabel('Ssim similarity %');

        subplot(1, 3, 3);
        bar(vector_Vdd, Y_1);
        set(gca, 'XDir','reverse')

        xlabel('Vdd scaling');
        ylabel('Euclidean distance diversity %');

        
        saveas(gcf, "./results/brigntess_and_contrast_compensation/global_stats.jpg");
       
    end
end