function [rho_change, theta_change] = move_point(source_numb, rho_now, theta_now, receive_number, R)
    % 移动点的位置
    
    % 获取接收点和源点的坐标
    x_r = rho_now(receive_number) * cos(theta_now(receive_number));
    y_r = rho_now(receive_number) * sin(theta_now(receive_number));
    x_s = rho_now(source_numb) * cos(theta_now(source_numb));
    y_s = rho_now(source_numb) * sin(theta_now(source_numb));
    
    % 计算各种距离
    d_or = sqrt(x_r ^ 2 + y_r ^ 2);
    d_sr = sqrt((x_r - x_s) ^ 2 + (y_r - y_s) ^ 2);
    d_ar = sqrt((x_r - R) ^ 2 + y_r ^ 2);
    d_sa = sqrt((x_s - R) ^ 2 + y_s ^ 2);
    
    % 计算角度
    alpha_oa = acos(max(-1, min(1, (d_or ^ 2 + d_ar ^ 2 - R ^ 2) / (2 * d_or * d_ar))));
    alpha_os = acos(max(-1, min(1, (d_or ^ 2 + d_sr ^ 2 - R ^ 2) / (2 * d_or * d_sr))));
    alpha_as = acos(max(-1, min(1, (d_ar ^ 2 + d_sr ^ 2 - d_sa ^ 2) / (2 * d_ar * d_sr))));
    
    beta = acos(max(-1, min(1, d_sa / (2 * R))));
    
    % 根据几何条件选择不同的计算方式
    if (abs(alpha_os - alpha_as - alpha_oa) < 1e-6) || (alpha_oa - alpha_os - alpha_as > 1e-6)
        tan_theta = (-2 * cos(beta) * sin(alpha_oa) * sin(alpha_oa + alpha_as + beta)) / ...
            (sin(alpha_as) + 2 * cos(beta) * sin(alpha_oa) * cos(alpha_oa + alpha_as + beta));
        theta = atan2(tan_theta, 1);
        
    elseif (abs(alpha_as - alpha_oa - alpha_os) < 1e-6) || alpha_as > pi
        tan_theta = (2 * cos(beta) * sin(alpha_oa) * sin(beta - alpha_os)) / ...
            (sin(alpha_as) - 2 * cos(beta) * sin(alpha_oa) * cos(beta - alpha_os));
        theta = atan2(tan_theta, 1);
        
    else
        tan_theta = (-2 * cos(beta) * sin(alpha_oa) * sin(beta + alpha_os)) / ...
            (sin(alpha_as) - 2 * cos(beta) * sin(alpha_oa) * cos(beta + alpha_os));
        theta = atan2(tan_theta, 1);
    end
    
    % 计算新的位置
    rho = R * sin(theta + alpha_oa) / sin(alpha_oa);
    theta_end = (receive_number - 1) * 2 * pi / 9;  % 修正索引
    
    delta_rho = R - rho;
    delta_theta = theta_end - theta;
    
    % 更新位置
    rho_change = rho_now;
    rho_change(receive_number) = rho_now(receive_number) + delta_rho;
    
    theta_change = theta_now;
    theta_change(receive_number) = theta_now(receive_number) + delta_theta;
end
