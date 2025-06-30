% 初始角度：0, 40.1°, …, 320.80° 共 8 个点（去掉了重复的 0°）
theta_now = [40.1, 80.21, 119.75, 159.86, 199.96, 240.07, 280.17, 320.80] ./ 360 .* 2 .* pi;
rho_last = 100;
rho_now = [98, 112, 105, 98, 112, 105, 98, 112];

% 目标角度 alpha_2(i) = π*(1 - i/9)
alpha_2 = pi * (1 - (1:8) ./ 9);

% 迭代计数器
move_number = 0;

% 计算 alpha_1 的函数，注意用 .^2 和 element-wise 运算
function alpha_1 = calculate_alpha_1(rho, theta, R)
    x = rho .* cos(theta);
    y = rho .* sin(theta);
    d1 = sqrt(x.^2 + y.^2);
    d2 = sqrt((x - R).^2 + y.^2);
    % 余弦定理求角度
    cos_val = (d1.^2 + d2.^2 - R.^2) ./ (2 .* d1 .* d2);
    % 防止数值略微越界
    cos_val = min(max(cos_val, -1), 1);
    alpha_1 = acos(cos_val);
end

% 主循环：不断调整 rho_now，直到 |alpha_1 - alpha_2| 全部小于 tol
tol = 1e-3;
max_iter = 1e5;

while true
    % 计算当前的 alpha_1（1×8 向量）
    alpha_1 = calculate_alpha_1(rho_now, theta_now, rho_last);
    
    % 检查是否全部满足精度要求
    if all(abs(alpha_1 - alpha_2) < tol)
        break;
    end
    
    % 防止死循环
    if move_number > max_iter
        warning('达到最大迭代次数，未全部收敛');
        break;
    end
    
    % 针对每一个点单独调整 rho_now(i)
    for i = 1:8
        diff = alpha_1(i) - alpha_2(i);
        if diff > tol
            rho_now(i) = rho_now(i) + 1;
        elseif diff < -tol
            rho_now(i) = rho_now(i) - 1;
        end
    end
    
    move_number = move_number + 1;
end

fprintf('迭代次数：%d\n', move_number);
disp('最终 rho_now =');
disp(rho_now);
