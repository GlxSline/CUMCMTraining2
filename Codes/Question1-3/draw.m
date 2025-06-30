theta_last = (0:8) * 2 *pi /9;
theta_now = [0, 40.1, 80.21, 119.75, 159.86, 199.96, 240.07, 280.17, 320.80] ./ 360 .* 2 .* pi;
rho_now = [100, 98, 112, 105, 98, 112, 105, 98, 112];
rho_last = 100;
% 极坐标转直角坐标
x_last = [0, rho_last .* cos(theta_last)];
y_last = [0, rho_last .* sin(theta_last)];
x_now  = [0, rho_now  .* cos(theta_now)];
y_now  = [0, rho_now  .* sin(theta_now)];


% 创建图形
figure;
hold on;
axis equal;
grid on;
% 绘制 R = 100 的圆 (灰色虚线)
t = linspace(0, 2*pi, 360);
h_circle = plot(100*cos(t), 100*sin(t), 'LineStyle','--', ...
    'Color',[0.5 0.5 0.5], 'LineWidth',1.5);
% 绘制 last 位置 (蓝色圆圈标记，无连线)
h_last = plot(x_last, y_last, 'LineStyle','none', ...
    'Marker','o', ...
    'MarkerEdgeColor',[0 0.4470 0.7410], ...
    'MarkerFaceColor',[0.3010 0.7450 0.9330], ...
    'MarkerSize',8);
% 绘制 now 位置 (红色星号标记，无连线)
h_now = plot(x_now, y_now, 'LineStyle','none', ...
    'Marker','*', ...
    'MarkerEdgeColor',[0.8500 0.3250 0.0980], ...
    'MarkerSize',10);
% % 标注各点编号
% for i = 1:length(x_last)
%     text(x_last(i)+2, y_last(i)+2, sprintf('L%d', i-1), ...
%         'Color',[0 0.4470 0.7410], 'FontSize',9);
%     text(x_now(i)+2,  y_now(i)+2,  sprintf('N%d', i-1), ...
%         'Color',[0.8500 0.3250 0.0980], 'FontSize',9);
% end
% 添加图例和标签
legend([h_circle, h_last, h_now], {'R=100 圆','最终位置','起始位置'}, ...
    'Location','best');
xlabel('X');
ylabel('Y');
% title('last 与 now 位置及 R=100 圆');
hold off;