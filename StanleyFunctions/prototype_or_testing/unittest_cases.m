clear all, close all, clc

AX = [0,20,40,60,70,80,90,100,120,130,140,150,160,170];
AY = [0,4,0,3,3,3,10,10,15,15,15,15,15,15];
interval = length(0:0.1:100);
pathX = linspace(0,max(AX),interval);
pathY = spline(AX,AY,pathX);

clear AX AY interval;

%% Constants
k_hard = 7;
k_soft = 0;
linear_velocity = 1.2;


%% Test Case 1 

pos_x = -1;

pos_y = -1;

% pi/2
veh_theta = 1.5708;

% Generate waypoint index
wpIndex = pathSearch(pathX,pathY,pos_x,pos_y);


disp(['Reference index for TC_1 is: ', num2str(wpIndex)]);

% Heading Calculation 
tc_11_heading = computeHeading(pathX,pathY,wpIndex);

disp(['wp heading for TC_1 is: ', num2str(tc_11_heading)]);

% Heading Delta Calculation
heading_delta = tc_11_heading - veh_theta;  

disp(['heading delta for TC_1 is: ', num2str(heading_delta)]);

% Cross Track Error calculation
target_wp = [pathX(wpIndex);pathY(wpIndex)];
veh_pos = [pos_x;pos_y];
crossTrackError = computeCTE(target_wp,veh_pos,tc_11_heading);
disp(['cross track error for TC_1 is: ', num2str(crossTrackError)]);

% Non-linear control term calculation
nonlin_ctrl_term = atan((k_hard*crossTrackError)/(k_soft+linear_velocity));
disp(['Non Lin Ctrl Term for TC_1 is: ', num2str(nonlin_ctrl_term)]);

% raw steering angle before saturation

raw_steering_angle = heading_delta + nonlin_ctrl_term;
disp(['raw steering angle for TC_1 is: ', num2str(raw_steering_angle)]);

% Stanley output

tc1_output = stanleyController(pathX,pathY,pos_x,pos_y,linear_velocity,veh_theta, wpIndex);
tc1_steering = tc1_output(1);
disp(['Filtered steering angle for TC_1 is: ', num2str(tc1_steering)]);


%% Test case 2

pos_x = 10.2;

pos_y = 4.5;

% 7.2422 degrees
veh_theta = 0.136;

% Generate waypoint index
wpIndex = pathSearch(pathX,pathY,pos_x,pos_y);

disp(['Reference index for TC_2 is: ', num2str(wpIndex)]);

% Test Case 2

% Heading Calculation 
tc_22_heading = computeHeading(pathX,pathY,wpIndex);

disp(['wp heading for TC_2 is: ', num2str(tc_22_heading)]);

% Heading Delta Calculation
heading_delta = tc_22_heading - veh_theta;  

disp(['heading delta for TC_2 is: ', num2str(heading_delta)]);

% Cross Track Error calculation
target_wp = [pathX(wpIndex);pathY(wpIndex)];
veh_pos = [pos_x;pos_y];
crossTrackError = computeCTE(target_wp,veh_pos,tc_22_heading);
disp(['cross track error for TC_2 is: ', num2str(crossTrackError)]);

% Non-linear control term calculation
nonlin_ctrl_term = atan((k_hard*crossTrackError)/(k_soft+linear_velocity));
disp(['Non Lin Ctrl Term for TC_2 is: ', num2str(nonlin_ctrl_term)]);

% raw steering angle before saturation

raw_steering_angle = heading_delta + nonlin_ctrl_term;
disp(['raw steering angle for TC_2 is: ', num2str(raw_steering_angle)]);

% Stanley output

tc2_output = stanleyController(pathX,pathY,pos_x,pos_y,linear_velocity,veh_theta, wpIndex);
tc2_steering = tc2_output(1);
disp(['Filtered steering angle for TC_2 is: ', num2str(tc2_steering)]);

%% Test Case 3

pos_x = 87.3;

pos_y = 8.5;

% 34 degrees
veh_theta = 0.5934;

% Generate waypoint index
wpIndex = pathSearch(pathX,pathY,pos_x,pos_y);

disp(['Reference index for TC_3 is: ', num2str(wpIndex)]);

% Test Case 3

% Heading Calculation 
tc_33_heading = computeHeading(pathX,pathY,wpIndex);

disp(['wp heading for TC_3 is: ', num2str(tc_33_heading)]);

% Heading Delta Calculation
heading_delta = tc_33_heading - veh_theta;  

disp(['heading delta for TC_3 is: ', num2str(heading_delta)]);

% Cross Track Error calculation
target_wp = [pathX(wpIndex);pathY(wpIndex)];
veh_pos = [pos_x;pos_y];
crossTrackError = computeCTE(target_wp,veh_pos,tc_33_heading);
disp(['cross track error for TC_3 is: ', num2str(crossTrackError)]);

% Non-linear control term calculation
nonlin_ctrl_term = atan((k_hard*crossTrackError)/(k_soft+linear_velocity));
disp(['Non Lin Ctrl Term for TC_3 is: ', num2str(nonlin_ctrl_term)]);

% raw steering angle before saturation

raw_steering_angle = heading_delta + nonlin_ctrl_term;
disp(['raw steering angle for TC_3 is: ', num2str(raw_steering_angle)]);

% Stanley output

tc3_output = stanleyController(pathX,pathY,pos_x,pos_y,linear_velocity,veh_theta, wpIndex);
tc3_steering = tc3_output(1);
disp(['Filtered steering angle for TC_3 is: ', num2str(tc3_steering)]);

%% Test Case 4

pos_x = 93.33;

pos_y = 10.7;

% pi/2
veh_theta = 0.01;

% Generate waypoint index
wpIndex = pathSearch(pathX,pathY,pos_x,pos_y);

disp(['Reference index for TC_4 is: ', num2str(wpIndex)]);

% Heading Calculation 
tc_44_heading = computeHeading(pathX,pathY,wpIndex);

disp(['wp heading for TC_4 is: ', num2str(tc_44_heading)]);

% Heading Delta Calculation
heading_delta = tc_44_heading - veh_theta;  

disp(['heading delta for TC_4 is: ', num2str(heading_delta)]);

% Cross Track Error calculation
target_wp = [pathX(wpIndex);pathY(wpIndex)];
veh_pos = [pos_x;pos_y];
crossTrackError = computeCTE(target_wp,veh_pos,tc_44_heading);
disp(['cross track error for TC_4 is: ', num2str(crossTrackError)]);

% Non-linear control term calculation
nonlin_ctrl_term = atan((k_hard*crossTrackError)/(k_soft+linear_velocity));
disp(['Non Lin Ctrl Term for TC_4 is: ', num2str(nonlin_ctrl_term)]);

% raw steering angle before saturation

raw_steering_angle = heading_delta + nonlin_ctrl_term;
disp(['raw steering angle for TC_4 is: ', num2str(raw_steering_angle)]);

% Stanley output

tc4_output = stanleyController(pathX,pathY,pos_x,pos_y,linear_velocity,veh_theta, wpIndex);
tc4_steering = tc4_output(1);
disp(['Filtered steering angle for TC_4 is: ', num2str(tc4_steering)]);

