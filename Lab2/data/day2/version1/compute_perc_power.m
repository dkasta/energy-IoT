%Convert the power absolute values in percentages (version 1)

function all_perc_power = compute_perc_power(all_modified_power, original_power)
   

    NUM_IMAGES = 220;
    NUM_ITERATIONS = 8;

    for iterations = 1:NUM_ITERATIONS
        for i = 1:NUM_IMAGES
            if (iterations == 1)
                Y(i, 1) = original_power{i};
                all_perc_power{iterations}{i} = ((original_power{i} - Y(i,iterations)) / original_power{i}) * 100;
            else
                Y(i, iterations) = all_modified_power{iterations}{i};
                all_perc_power{iterations}{i} = ((original_power{i} - Y(i,iterations)) / original_power{i}) * 100;
            end
        end
    end
            
            

end
