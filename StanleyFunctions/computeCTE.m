function cte = computeCTE(path_pos, veh_pos, path_heading)
    %{
    % Transformation Method (see proof)
    
    % Stuff the Z axis compoenet with zero
    path_pos(3) = 0;
    veh_pos(3) = 0;
    
    adjusted_path_pos = zeros(3);
    adjusted_veh_pos = zeros(3);
    adjusted_path_pos(:,3) = path_pos;
    adjusted_veh_pos(:,3) = veh_pos;
    
    rot_mat = [cos(-path_heading) (-1)*sin(-path_heading) 0;...
               sin(-path_heading) cos(-path_heading) 0;...
               0 0 1];
    transformed_path_pos = rot_mat * adjusted_path_pos ;
    transformed_veh_pos = rot_mat * adjusted_veh_pos;
    
    cte = transformed_path_pos(2) - transformed_veh_pos(2);
    %}
       
    % dx*sin(path_heading) - dy*cos(path_heading);
    cte = (veh_pos(1)-path_pos(1))*sin(path_heading) - (veh_pos(2)-path_pos(2))*cos(path_heading);
end

