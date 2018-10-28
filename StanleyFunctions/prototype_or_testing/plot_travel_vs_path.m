plot(pathX,pathY, '-m', 'LineWidth', 3);
hold on;
plot(x_pos_cg,y_pos_cg, '-g', 'LineWidth', 2);
title('Vehicle position Vs. Desired path w/ gain of 7');
legend('Desired Path','Actual position');
xlabel('X [m]');
ylabel('Y [m]');

disp(["Average cross track error", num2str(mean(crossTrackError))]);
root_mean_square_CTE = sqrt(sum(crossTrackError.^2)/length(crossTrackError));