function alpha_1 = calculate_alpha_1(rho_now, theta_now, R)
    % 计算笛卡尔坐标
    x = rho_now .* cos(theta_now);
    y = rho_now .* sin(theta_now);
    
    % 计算距离
    d1 = sqrt(x .^ 2 + y .^ 2);
    d2 = sqrt((x - R) .^ 2 + y .^ 2);
    
    % 使用余弦定理计算角度
    cos_val = (d1 .^ 2 + d2 .^ 2 - R ^ 2) ./ (2 * d1 .* d2);
    
    % 确保cos值在有效范围内
    cos_val = max(-1, min(1, cos_val));
    
    alpha_1 = acos(cos_val);
end
