function path_heading = computeHeading(pathX, pathY, index)
    path_heading = 0;
    if(length(pathX) == length(pathY))
        pathSize = length(pathX);
    else
       	path_heading = -69;
        return;
    end

    if(pathSize < 4)
        % If path size is less than the limit of cubic fit, then use linear
        % fit
       if(index == pathSize)
           % Take the last point's heading if reference wp is last point in
           % path
            path_heading = atan2(pathY(index) - pathY(index-1), pathX(index) - pathX(index-1));
       else
            path_heading = atan2(pathY(index+1)-pathY(index), pathX(index+1)-pathX(index)); 
       end
    else
        fit_quadra = zeros(3,1);
        if(index == pathSize)
           % backward fit 
           disp('index = pathsize');
           fit_quadra = quadraFit(pathX(index-2),pathY(index-2),...
                                 pathX(index-1),pathY(index-1),...
                                 pathX(index),pathY(index));           
        elseif(index == 1)
           disp('index == 1');
           fit_quadra = quadraFit(pathX(index+2),pathY(index+2),...
                                 pathX(index+1),pathY(index+1),...
                                 pathX(index),pathY(index));
        else
           disp('index == normal');
           fit_quadra = quadraFit(pathX(index+1),pathY(index+1),...
                                 pathX(index),pathY(index),...
                                 pathX(index-1),pathY(index-1));            
        end
        %{
        if(fit_quadra(1) < 0.01)
        % Straight line
        fit_quadra = [fit_quadra(2)/2; fit_quadra(3); 0];
        end
        %}
        path_heading = heading_from_quadra(fit_quadra,...
                                          index,pathX);          
    end
end

