clear; clc; close all;

% 初始化数据
data_init;

move_number = 0;

% 第一波移动
fprintf('开始第一波移动...\n');
[rho_now, move_number] = first_move(rho_now, theta_now, rho_last, move_number);
fprintf('第一波移动完成，总移动次数: %d\n', move_number);

% 第二波移动
fprintf('开始第二波移动...\n');
for move_times = 1:7
    % 计算当前alpha_1
    alpha_1 = calculate_alpha_1(rho_now, theta_now, rho_last);
    
    % 找到最小差值对应的源点
    [alpha_min, source_numb] = min(abs(alpha_1 - alpha_2));
    
    % 计算接收点编号（避免为0的情况）
    receive_number = mod(move_times - 1, 8) + 1;
    
    % 如果源点和接收点不同，则进行移动
    if receive_number ~= source_numb
        fprintf('第%d次移动: 源点%d -> 接收点%d\n', move_times, source_numb, receive_number);
        [rho_now, theta_now] = move_point(source_numb, rho_now, theta_now, receive_number, rho_last);
        move_number = move_number + 1;
    else
        fprintf('第%d次移动: 源点和接收点相同，跳过\n', move_times);
    end
end

fprintf('所有移动完成，总移动次数: %d\n', move_number);

% 可视化结果
visualize_results(rho_now, theta_now, rho_last, theta_last);
