function visualize_results(rho_now, theta_now, rho_last, theta_last)
    figure('Position', [100, 100, 800, 600]);
    
    % 转换为笛卡尔坐标
    x_now = rho_now .* cos(theta_now);
    y_now = rho_now .* sin(theta_now);
    x_last = rho_last .* cos(theta_last);
    y_last = rho_last .* sin(theta_last);
    
    % 绘制结果
    polar_subplot = subplot(1, 2, 1);
    polarplot(theta_now, rho_now, 'ro-', 'LineWidth', 2, 'MarkerSize', 8);
    hold on;
    polarplot(theta_last, rho_last * ones(size(theta_last)), 'b*-', 'LineWidth', 1, 'MarkerSize', 6);
    legend('当前位置', '目标位置', 'Location', 'best');
    title('极坐标系中的点位置');
    
    cart_subplot = subplot(1, 2, 2);
    plot(x_now, y_now, 'ro-', 'LineWidth', 2, 'MarkerSize', 8);
    hold on;
    plot(x_last, y_last, 'b*-', 'LineWidth', 1, 'MarkerSize', 6);
    plot(100, 0, 'gs', 'MarkerSize', 10, 'LineWidth', 2);  % 参考点
    axis equal;
    grid on;
    legend('当前位置', '目标位置', '参考点(100,0)', 'Location', 'best');
    title('笛卡尔坐标系中的点位置');
    xlabel('X');
    ylabel('Y');
end
