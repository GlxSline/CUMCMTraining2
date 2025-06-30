data;
move_number = 0;

% 第一波移动
first_move;

% 第二波移动
times_max = 10;
error_numb = zeros(1, times_max);

for move_times = 1:times_max
    error_numb(move_times) = calculate_error(rho_now, rho_last, theta_now, theta_last);
    [alpha_min, source_numb] = min(abs(alpha_1 - alpha_2));
    receive_number = mod(move_times - 1, 8) + 1;
    % source_numb = mod(receive_number, 8) + 1;

    if receive_number ~= source_numb
        [rho_now, theta_now] = move_point(source_numb, rho_now, theta_now, receive_number);
        move_number = move_number + 1;
    end

    alpha_1 = calculate_alpha_1(rho_now, theta_now, rho_last);

end

% figure;
% plot((1:times_max), error_numb);