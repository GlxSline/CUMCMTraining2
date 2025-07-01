% generate_point;
% p = randperm(8); % 随机排列 1…8
% p(p == rand_number(:, 1)) = []; % 删除等于 x 的元素
% %another= p(1);                          % 取第一个
% %x_another=R_chosen*cos(another*2*pi/9);
% %y_another=R_chosen*sin(another*2*pi/9);
% %构建定弦对定角的圆方程，以便之后求解圆弧的两个端点坐标
% % 假设三点
% P = [0, 0;
%      100, 0;
%      x_rand(:, 1), y_rand(:, 1)];

% % 构造一个三角形的 triangulation 对象
% T = triangulation([1 2 3], P);

% % 直接调用 circumcenter
% [C, R] = circumcenter(T);
% % C 是 1×2 圆心坐标，[xc,yc]=C
% % R 是对应的圆半径

% xc = C(1);
% yc = C(2);
% r = R(1);

% fprintf('圆心=(%.4f,%.4f), 半径=%.4f\n', xc, yc, r);
% %构建除待测点外的另外七个点坐标
% i = 1:7;
% theta = i * 2 * pi / 9;
% x_another = R_chosen * cos(theta);
% y_another = R_chosen * sin(theta);
% %求角度关系
% dx_another_rand = x_another - x_rand(:, 1);
% dy_another_rand = y_another - y_rand(:, 1);
% k_another_rand = dy_another_rand ./ dx_another_rand;
% k_origin_rand = -y_rand(:, 1) ./ x_rand(:, 1);
% dx_known_rand = 100 - x_rand(:, 1);
% dy_known_rand = 0 - y_rand(:, 1);
% k_known_rand = dy_known_rand ./ dx_known_rand;



% % 示例1：圆心在(2,3)，半径为5，求极角为π/4的点
% cx = 2; cy = 3; r = 5; theta = pi/4;
% [x, y] = polar_point_on_circle(cx, cy, r, theta);
% fprintf('点坐标：(%.4f, %.4f)\n', x, y);

% % 示例2：验证结果
% dist_to_center = sqrt((x-cx)^2 + (y-cy)^2);
% fprintf('到圆心距离：%.4f (应等于半径%.4f)\n', dist_to_center, r);

% % 示例3：批量计算多个角度
% thetas = linspace(0, 2*pi, 8);  % 8个等分角度
% points = zeros(length(thetas), 2);
% for i = 1:length(thetas)
%     [points(i,1), points(i,2)] = polar_point_on_circle(cx, cy, r, thetas(i));
% end

% % 绘图验证
% figure;
% % 画圆
% theta_circle = linspace(0, 2*pi, 100);
% x_circle = cx + r * cos(theta_circle);
% y_circle = cy + r * sin(theta_circle);
% plot(x_circle, y_circle, 'b-', 'LineWidth', 2);
% hold on;

% % 画圆心
% plot(cx, cy, 'ro', 'MarkerSize', 8, 'MarkerFaceColor', 'r');

% % 画原点
% plot(0, 0, 'ko', 'MarkerSize', 8, 'MarkerFaceColor', 'k');

% % 画计算得到的点
% plot(points(:,1), points(:,2), 'g*', 'MarkerSize', 10);

% % 画从原点到各点的射线
% for i = 1:size(points, 1)
%     plot([0, points(i,1)], [0, points(i,2)], 'g--', 'LineWidth', 1);
% end

% axis equal;
% grid on;
% legend('圆', '圆心', '原点', '计算点', '射线');
% title('圆上点的极坐标计算验证');
% xlabel('x'); ylabel('y');


center = [50, 41.92];        % 圆心坐标
radius = 65;             % 半径
angles = linspace(0, 2 *pi ,10);  % 极角数组



% 示例2：使用方案二（相对于原点的极角）
[x2, y2] = polar_point_on_circle(center, radius, angles);

fprintf('\n方案二结果:\n');
for i = 1:length(angles)
    if ~isnan(x2(i))
        fprintf('角度%.2f: (%.2f, %.2f)\n', angles(i), x2(i), y2(i));
    else
        fprintf('角度%.2f: 无解\n', angles(i));
    end
end

% 绘图验证
figure;

theta = linspace(0, 2*pi, 100);
circle_x = center(1) + radius * cos(theta);
circle_y = center(2) + radius * sin(theta);
plot(circle_x, circle_y, 'b-', 'LineWidth', 2);
hold on;
valid_idx = ~isnan(x2);
plot(x2(valid_idx), y2(valid_idx), 'go', 'MarkerSize', 8, 'MarkerFaceColor', 'g');
plot(center(1), center(2), 'k+', 'MarkerSize', 10, 'LineWidth', 2);
plot(0, 0, 'r+', 'MarkerSize', 10, 'LineWidth', 2);
grid on;
axis equal;
title('方案二：相对于原点的极角');
xlabel('X'); ylabel('Y');