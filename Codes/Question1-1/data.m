% theta_last = (1:8) .* 2 .*pi /9;
% % theta_now = [0, 40.1, 80.21, 119.75, 159.86, 199.96, 240.07, 280.17, 320.80] ./ 360 .* 2 .* pi;
% theta_now = [40.1, 80.21, 119.75, 159.86, 199.96, 240.07, 280.17, 320.80] ./ 360 .* 2 .* pi;
% rho_last = 100 .* linspace(1,1,8);
% % rho_now = [100, 98, 112, 105, 98, 112, 105, 98, 112];
% rho_now = [98, 112, 105, 98, 112, 105, 98, 112];
rho_now = linspace(100, 100, 8);
theta_now = (1:8) .* 2 .*pi /9;

x_last = rho_last .* cos(theta_last);
y_last = rho_last .* sin(theta_last);
x_now  = rho_now  .* cos(theta_now);
y_now  = rho_now  .* sin(theta_now);
