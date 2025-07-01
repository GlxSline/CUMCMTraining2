point_number = 1000;
x_origin = zeros(1, point_number);
y_origin = zeros(1, point_number);
% x_final = zeros(1, point_number);
% y_final = zeros(1, point_number);
max_delta = inf(1, point_number);

for i = 1:point_number

    % rand_number = randi(8);
    rand_number = 1;
    rho_now = linspace(100, 100, 8);
    theta_now = (1:8) .* 2 .* pi / 9;
    x_now = rho_now .* cos(theta_now);
    y_now = rho_now .* sin(theta_now);

    x_chosen = 100 .* cos(theta_now(rand_number));
    y_chosen = 100 .* sin(theta_now(rand_number));

    R_rand_max = 30;
    R_rand = R_rand_max * rand();
    theta_rand = 2 * pi * rand();

    x_rand = x_chosen + R_rand * cos(theta_rand);
    y_rand = y_chosen + R_rand * sin(theta_rand);

    [center, radius] = find_circle(x_rand, y_rand);

    % 偏转角
    calc_times = 10000;
    theta_center = theta_now(rand_number);
    theta_delta = [linspace(0, pi / 9, calc_times); linspace(0, -1 * pi / 9, calc_times)];
    theta_circle = theta_center + theta_delta;
    [x_circle_1, y_circle_1] = polar_point_on_circle(center, theta_circle(1, :));
    [x_circle_2, y_circle_2] = polar_point_on_circle(center, theta_circle(2, :));

    angle_1 = zeros(7, calc_times);
    angle_2 = zeros(7, calc_times);

    % figure;
    % hold on;
    % axis equal;
    % grid on;
    % x_temp = center(1) + cos(linspace(0, 2 * pi, 100)) * radius;
    % y_temp = center(2) + sin(linspace(0, 2 * pi, 100)) * radius;
    % x_temp2 = cos(linspace(0, 2 * pi, 100)) * 100;
    % y_temp2 = sin(linspace(0, 2 * pi, 100)) * 100;
    % plot(x_temp, y_temp, 'r');
    % plot(x_circle_1, y_circle_1,'g');
    % plot(x_temp2, y_temp2,'b');

    temp_numb = 1;

    for j = 1:8

        if j ~= rand_number
            x_send = x_now(j);
            y_send = y_now(j);
            d_s_01 = sqrt((x_send - 100) ^ 2 + y_send ^ 2);

            d_01_r1 = sqrt((x_circle_1 - 100) .^ 2 + y_circle_1 .^ 2);
            d_r1_s = sqrt((x_circle_1 - x_send) .^ 2 + (y_circle_1 - y_send) .^ 2);
            angle_1(temp_numb, :) = acos((d_r1_s .^ 2 + d_01_r1 .^ 2 - d_s_01 .^ 2) ./ (2 .* d_01_r1 .* d_r1_s));

            d_01_r2 = sqrt((x_circle_2 - 100) .^ 2 + y_circle_2 .^ 2);
            d_r2_s = sqrt((x_circle_2 - x_send) .^ 2 + (y_circle_2 - y_send) .^ 2);
            angle_2(temp_numb, :) = acos((d_r2_s .^ 2 + d_01_r2 .^ 2 - d_s_01 .^ 2) ./ (2 .* d_01_r2 .* d_r2_s));

            temp_numb = temp_numb + 1;

        end

    end

    for j = 1:calc_times
        angle_temp = [angle_1(:, j), angle_2(:, j)];
        large_angle = max(angle_temp, [], 2);
        small_angle = min(angle_temp, [], 2);
        large_angle = sort(large_angle);
        small_angle = sort(small_angle);
        judge = 1;

        for k = 1:6

            if (small_angle(k + 1) - large_angle(k) < 0)
                judge = 0;
                break;
            end

        end

        if judge == 0
            max_delta(i) = theta_delta(1, j);
            break;
        else
            x_origin(i) = x_rand;
            y_origin(i) = y_rand;
        end

    end

end

figure;
hold on;
axis equal;
grid on;
x_temp2 = cos(linspace(0, 2 * pi, 100)) * 100;
y_temp2 = sin(linspace(0, 2 * pi, 100)) * 100;
% plot(x_origin, y_origin);
scatter(x_origin, y_origin, 6, 'filled');
% plot(x_circle_1, y_circle_1, 'g');
plot(x_temp2, y_temp2, 'r');

result = min(max_delta .* (max_delta > 0.15) + 2 .* (max_delta < 0.15));

% left_arrange = min(angle, [], 2);
% right_arrange = max(angle, [], 2);
% judge = 1;

% for j = 1:6

%     if (left_arrange(j + 1) - right_arrange(j) < 0)
%         judge = 0;
%         break;
%     end

% end

% if judge ~= 0
%     x_origin(i) = x_rand;
%     y_origin(i) = y_rand;
% end

% x_origin(i) = x_rand;
% y_origin(i) = y_rand;

% rho_now(rand_number(1)) = sqrt(x_rand ^ 2 + y_rand ^ 2);
% theta_now(rand_number(1)) = atan2(y_rand, x_rand);

% if theta_now(rand_number(1)) < 0
%     theta_now(rand_number(1)) = 2 * pi + theta_now(rand_number(1));
% end

% [rho_now, theta_now] = move_point(rand_number(2), rho_now, theta_now, rand_number(1));

% x_final(i) = rho_now(rand_number(1)) * cos(theta_now(rand_number(1)));
% y_final(i) = rho_now(rand_number(1)) * sin(theta_now(rand_number(1)));
