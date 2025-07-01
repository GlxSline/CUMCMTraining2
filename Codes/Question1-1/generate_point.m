% 随机选3， 且第一个为偏移点
x_origin = zeros(1, 2000);
y_origin = zeros(1, 2000);
x_final = zeros(1, 2000);
y_final = zeros(1, 2000);
rand_number = zeros(1, 2);

for i = 1:2000
    
    rho_now = linspace(100, 100, 8);
    theta_now = (1:8) .* 2 .* pi / 9;

    % rand_number = randperm(8, 2);
    rand_number(1) = mod(i-1, 8) + 1;
    % rand_number(1) = 8;
    % rand_number(2) = 3;
    rand_number(2) = mod(rand_number(1), 8) + 1;

    % theta_chosen = coordinates_all(rand_number);
    x_chosen = 100 .* cos(theta_now(rand_number(1)));
    y_chosen = 100 .* sin(theta_now(rand_number(1)));

    R_rand_max = 3;
    R_rand = R_rand_max * rand();
    theta_rand = 2 * pi * rand();

    x_rand = x_chosen + R_rand * cos(theta_rand);
    y_rand = y_chosen + R_rand * sin(theta_rand);

    x_origin(i) = x_rand;
    y_origin(i) = y_rand;

    rho_now(rand_number(1)) = sqrt(x_rand ^ 2 + y_rand ^ 2);
    theta_now(rand_number(1)) = atan2(y_rand, x_rand);

    if theta_now(rand_number(1)) < 0
        theta_now(rand_number(1)) = 2 * pi + theta_now(rand_number(1));
    end

    [rho_now, theta_now] = move_point(rand_number(2), rho_now, theta_now, rand_number(1));

    x_final(i) = rho_now(rand_number(1)) * cos(theta_now(rand_number(1)));
    y_final(i) = rho_now(rand_number(1)) * sin(theta_now(rand_number(1)));

end


figure;
hold on;
axis equal;
grid on;
% 绘制 origin 点集
scatter(x_origin, y_origin, 10, 'b', 'filled', 'DisplayName', 'Origin Points');
% 绘制 final 点集
scatter(x_final, y_final, 10, 'r', 'filled', 'DisplayName', 'Final Points');
legend('Location','best');
title('Original & Final Point Sets');
hold off;