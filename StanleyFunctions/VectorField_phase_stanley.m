[x,y] = meshgrid(-20:0.1:20,deg2rad(-21):0.1:deg2rad(21));

k_hard = 7;

u = atan(k_hard.*x);
v = -k_hard.*x/sqrt(1+(k_hard.*x).^2);

figure
quiver(x,y,u,v)