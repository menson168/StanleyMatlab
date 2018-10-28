function heading = heading_from_quadra(quadra_coeff,index, pathX)

quadra_ddt_coeff = [2*quadra_coeff(1) quadra_coeff(2)];
% Locate the slope at the point

slope = quadra_ddt_coeff(1)*pathX(index) + quadra_ddt_coeff(2);
%disp(slope);
%disp(quadra_ddt_coeff(1));
current_y = quadra_coeff(1)*pathX(index)^2 + quadra_coeff(2)*pathX(index) + quadra_coeff(3);
%disp(current_y);
y_int = current_y - slope*pathX(index);
%disp(y_int);
if(index == length(pathX))
    % If the reference index is at the last point of the path

    % We will take the heading same as the second to last point as
    % there is no next point to reference to relative to the last 
    % target waypoint in the path.
    dx = pathX(index) - pathX(index-1);
    dy = current_y - (slope*pathX(index-1)+y_int);
else
   dx = pathX(index+1) - pathX(index);
   dy = ((slope*pathX(index + 1))+y_int) - current_y;
   %disp(dy);
end

heading = atan2(dy,dx);
end

