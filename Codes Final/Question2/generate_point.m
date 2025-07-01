x_plane = [4, 3, 3, 2, 2, 2, 1, 1, 1, 1, 0, 0, 0, 0, 0] .* 25 .* sqrt(3);
y_plane = [0, 1, -1, 2, 0, -2, 3, 1, -1, -3, 4, 2, 0, -2, -4] .* 25;

rand_rho = 3 * rand(1, 15);
rand_theta = 2 * pi * rand(1, 15);

x_plane_now = x_plane + rand_rho .* cos(rand_theta);
y_plane_now = y_plane + rand_rho .* sin(rand_theta);
