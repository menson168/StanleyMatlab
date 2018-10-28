clear, close all

% Symbolic Proof of the Cross Track Error (Lateral Error) Calculation
syms px py vx vy ptheta

path_pos = [px;py;0];
veh_pos = [vx ; vy ; 0];

adjusted_path_pos = [px;...
                     py;...
                     0;...
                     1];
adjusted_veh_pos = [vx;...
                    vy;...
                    0;...
                    1];

rot_mat = [cos(-ptheta) (-1)*sin(-ptheta) 0 0;...
           sin(-ptheta) cos(-ptheta) 0 0;...
           0 0 1 0;...
           0 0 0 1];
       
transformed_pp = rot_mat * adjusted_path_pos;
transformed_vp = rot_mat * adjusted_veh_pos;

cte_proof = transformed_pp(2) - transformed_vp(2);

disp(cte_proof);

% Proof that:
% CTE = (vx-px)sin(ptheta) - (vy-py)cos(ptheta)
% v denote vehicle
% p denote path

%{

pt = [1;1;0];
pt_ref = [2;0.5;0];
ptheta = deg2rad(66);
rot_mat = [cos(-ptheta) (-1)*sin(-ptheta) 0;...
           sin(-ptheta) cos(-ptheta) 0;...
           0 0 1];
trans_pt = rot_mat*pt;
trans_pt_ref = rot_mat*pt_ref;

distance_og = sqrt(1+(0.25));
distance_post_trans = sqrt((trans_pt_ref(1)-trans_pt(1))^2 + (trans_pt_ref(2) - trans_pt(2))^2);

if(distance_og ~= distance_post_trans)
    disp("Distance doesn't match up post transformation!");
else
    disp("Distance match up post transformation!");
end    

cte = trans_pt_ref(2) - trans_pt(2);
disp(["Distance og: " num2str(distance_og)]);
disp(["CTE: " num2str(cte)]);



figure();
plot(pt(1),pt(2),'*r');
hold on;
plot(pt_ref(1),pt_ref(2), '*g');
plot(trans_pt(1), trans_pt(2), 'or');
plot(trans_pt_ref(1), trans_pt_ref(2), 'og');
xlim([-3 3]);
ylim([-3 3]);
%}