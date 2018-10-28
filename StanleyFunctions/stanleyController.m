function [steeringAngle, wp_heading, crossTrackError, heading_delta] = stanleyController(pathX,pathY,vehX,vehY,linear_velocity,veh_heading, wpIndex)
% Stanley lateral controller

k_hard = 7;
k_soft = 0;

% Calculate path heading
wp_heading = computeHeading(pathX,pathY,wpIndex);

% Calculate Heading Error
heading_delta = wp_heading-veh_heading;

% Calculate cross track error
target_wp = [pathX(wpIndex);pathY(wpIndex)];
veh_pos = [vehX;vehY];
crossTrackError = computeCTE(target_wp,veh_pos,wp_heading);

% Calculate nonlinear control term
nonlin_ctrl_term = atan((k_hard*crossTrackError)/(k_soft+linear_velocity));

% Saturation Function to limit steering angle, steering angle limited at 21
% degrees
rawSteeringAngle = heading_delta + nonlin_ctrl_term;

% 21 deg, not using deg2rad because that's what's listed in the fusionad
% code of control module
if(abs(rawSteeringAngle) > 0.36652)
    steeringAngle = (rawSteeringAngle/abs(rawSteeringAngle)) * deg2rad(21);
else
    steeringAngle = rawSteeringAngle;
end

end

