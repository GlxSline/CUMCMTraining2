% 在圆上均匀分布9个点，并标注 FY01–FY09，圆心标注 FY00

% 参数设置
R = 1;                 % 圆的半径
n = 9;                 % 点的个数
theta = linspace(0, 2*pi, n+1);  % 0 到 2π 均分 n 段，多一个点用于闭合
theta(end) = [];       % 去掉最后一个点，保持 n 个点

% 计算圆上各点坐标
x = R * cos(theta);
y = R * sin(theta);

% 绘图
figure;
hold on;
axis equal off;

% 画出圆
t = linspace(0,2*pi,200);
plot(R*cos(t), R*sin(t), 'k-','LineWidth',1);

% 标注圆心
plot(0,0,'ro','MarkerFaceColor','r','MarkerSize',6);
text(0, 0, ' FY00', 'VerticalAlignment','bottom','HorizontalAlignment','left','FontSize',12);

% 标注圆上均匀分布的9个点
for k = 1:n
    plot(x(k), y(k), 'bo','MarkerFaceColor','b','MarkerSize',6);
    label = sprintf('FY%02d', k);
    % 给标注一个稍微远离点的位置
    tx = 1.1 * x(k);
    ty = 1.1 * y(k);
    text(tx, ty, [' ' label], 'FontSize',12, ...
         'HorizontalAlignment','center', 'VerticalAlignment','middle');
end

hold off;
