function [rho_new, move_count] = first_move(rho_now, theta_now, rho_last, initial_move_count)
    % 第一波移动：调整径向距离以匹配目标角度
    
    rho_new = rho_now;
    move_count = initial_move_count;
    
    % 计算目标alpha_2
    alpha_2 = pi / 2 - pi ./ 9 .* [linspace(1, 4, 4), linspace(4, 1, 4)];
    
    % 计算初始alpha_1
    alpha_1 = calculate_alpha_1(rho_new, theta_now, rho_last);
    
    max_iterations = 1000;  % 防止无限循环
    iteration = 0;
    tolerance = 0.01;
    
    while max(abs(alpha_1 - alpha_2)) > tolerance && iteration < max_iterations
        iteration = iteration + 1;
        
        for i = 1:length(rho_new)
            if alpha_1(i) - alpha_2(i) > tolerance
                rho_new(i) = rho_new(i) + 1;
            elseif alpha_1(i) - alpha_2(i) < -tolerance
                rho_new(i) = rho_new(i) - 1;
            end
            
            % 重新计算alpha_1
            alpha_1(i) = calculate_alpha_1(rho_new(i), theta_now(i), rho_last);
        end
        
        move_count = move_count + 1;
        
        % 输出进度
        if mod(iteration, 100) == 0
            fprintf('第一波移动迭代 %d, 最大误差: %.6f\n', iteration, max(abs(alpha_1 - alpha_2)));
        end
    end
    
    if iteration >= max_iterations
        warning('第一波移动达到最大迭代次数，可能未收敛');
    end
    
    fprintf('第一波移动完成，迭代次数: %d, 最终误差: %.6f\n', iteration, max(abs(alpha_1 - alpha_2)));
end
