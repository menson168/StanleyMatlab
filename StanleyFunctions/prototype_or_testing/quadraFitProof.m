clear all; close all;

pathX = [1:50];
pathY = [[1:20] 20.*ones(1,10) [21:40]];
coeff = quadraFit(pathX(22),pathY(22),pathX(23),pathY(23),pathX(24),pathY(24));
index = 1;

heading = heading_from_quadra(coeff, 23, pathX);

for i = 1:50
    p_heading(i) = computeHeading(pathX,pathY, i);
end



x_mat = [19:0.1:21]';
newY = x_mat.^2 * coeff(1) + x_mat * coeff(2) + coeff(3);


tangent_line = x_mat* (2*coeff(1)) + coeff(2);

plot(pathX,pathY,'-y');
hold on;
plot(x_mat,newY, '-g');
plot(x_mat,tangent_line, '-b');