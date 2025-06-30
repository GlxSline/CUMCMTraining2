function data_init()
    % 定义为全局变量或返回值，这里使用assignin将变量赋值到base workspace
    
    theta_last = (0:8) * 2 * pi / 9;
    theta_now = [40.1, 80.21, 119.75, 159.86, 199.96, 240.07, 280.17, 320.80] ./ 360 .* 2 .* pi;
    rho_last = 100;
    rho_now = [98, 112, 105, 98, 112, 105, 98, 112];
    
    % 计算期望的alpha_2
    alpha_2 = pi / 2 - pi ./ 9 .* [linspace(1, 4, 4), linspace(4, 1, 4)];
    
    % 计算笛卡尔坐标
    x_last = rho_last .* cos(theta_last);
    y_last = rho_last .* sin(theta_last);
    x_now = rho_now .* cos(theta_now);
    y_now = rho_now .* sin(theta_now);
    
    % 将变量赋值到base workspace
    assignin('base', 'theta_last', theta_last);
    assignin('base', 'theta_now', theta_now);
    assignin('base', 'rho_last', rho_last);
    assignin('base', 'rho_now', rho_now);
    assignin('base', 'alpha_2', alpha_2);
    assignin('base', 'x_last', x_last);
    assignin('base', 'y_last', y_last);
    assignin('base', 'x_now', x_now);
    assignin('base', 'y_now', y_now);
end
