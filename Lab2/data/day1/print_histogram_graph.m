function print_histogram_graph(img, RGB, index)

    set(0,'DefaultFigureVisible','off')

    HIST_IN = zeros([256 3]);
    HIST_OUT = zeros([256 3]);

    HIST_IN(:,1) = imhist(img(:, :, 1), 256); %RED
    HIST_IN(:,2) = imhist(img(:, :, 2), 256); %GREEN
    HIST_IN(:,3) = imhist(img(:, :, 3), 256); %BLUE

    HIST_OUT(:,1) = imhist(RGB(:, :, 1), 256); %RED
    HIST_OUT(:,2) = imhist(RGB(:, :, 2), 256); %GREEN
    HIST_OUT(:,3) = imhist(RGB(:, :, 3), 256); %BLUE

    figure 
   % set(gcf,'position',[10, 10, 1000, 800])
    
    subplot(2, 2, 1);
    imshow(img);
    subplot(2, 2, 2);
    hold on
    bar(HIST_IN(:, 1), 'FaceColor', [1 0 0]);
    bar(HIST_IN(:, 2), 'FaceColor', [0 1 0]);
    bar(HIST_IN(:, 3), 'FaceColor', [0 0 1]);
    hold off

    legend('Red', 'Green', 'Blue');

    subplot(2, 2, 3);
    imshow(RGB);
    subplot(2, 2, 4);
    hold on
    bar(HIST_OUT(:, 1), 'FaceColor', [1 0 0]);
    bar(HIST_OUT(:, 2), 'FaceColor', [0 1 0]);
    bar(HIST_OUT(:, 3), 'FaceColor', [0 0 1]);
    hold off

    legend('Red', 'Green', 'Blue');
    
    sgtitle('Before and after Histogram Equalization');
    
    saveas(gcf, "./results/histogram_equalization/img" + int2str(index) + "/" + "hist_graph.bmp");
end
