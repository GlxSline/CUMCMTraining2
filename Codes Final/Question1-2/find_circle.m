function [center, radius] = find_circle(x_rand, y_rand)
    % 通过三个点求圆心和半径
    % 输入: x_rand, y_rand - 随机点坐标
    % 输出: center - 圆心坐标 [x, y], radius - 半径
    
    % 三个已知点
    x1 = 0; y1 = 0;           % 点1: (0, 0)
    x2 = 100; y2 = 0;         % 点2: (100, 0)
    x3 = x_rand; y3 = y_rand; % 点3: (x_rand, y_rand)
    
    % 方法1: 解析几何方法
    % 由于点1和点2都在x轴上，圆心x坐标必为两点中点
    h = (x1 + x2) / 2;  % 圆心x坐标 = 50
    
    % 利用三点到圆心距离相等求圆心y坐标
    % (x1-h)² + (y1-k)² = (x3-h)² + (y3-k)²
    % 化简得: k = (x3² - 2*h*x3 + y3²) / (2*y3)
    k = (x3^2 - 2*h*x3 + y3^2) / (2*y3);
    
    % 计算半径
    radius = sqrt((x1-h)^2 + (y1-k)^2);
    
    % 输出结果
    center = [h, k];
    
    % % 验证三点是否都在圆上
    % dist1 = sqrt((x1-h)^2 + (y1-k)^2);
    % dist2 = sqrt((x2-h)^2 + (y2-k)^2);
    % dist3 = sqrt((x3-h)^2 + (y3-k)^2);
    
    % fprintf('圆心坐标: (%.4f, %.4f)\n', h, k);
    % fprintf('半径: %.4f\n', radius);
    % fprintf('验证 - 点到圆心距离:\n');
    % fprintf('  点(0,0): %.6f\n', dist1);
    % fprintf('  点(100,0): %.6f\n', dist2);
    % fprintf('  点(%.2f,%.2f): %.6f\n', x_rand, y_rand, dist3);
end
