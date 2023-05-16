function print_luminance_reduction_originalVSmodified(original_image, modified_image, index, perc)

    figure
    set(gcf,'visible','off')
    subplot(1, 2, 1), imshow(original_image)
    subplot(1, 2, 2), imshow(modified_image)
    sgtitle("Image #" + int2str(index) + ", color reduction of " + int2str(perc*10) + "%");
   
    saveas(gcf, "./results/color_reduction/img" + int2str(index) + "/" + "perc_" + int2str(perc*10) + ".bmp");

end