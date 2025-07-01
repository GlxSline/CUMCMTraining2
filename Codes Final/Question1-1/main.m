generate_point;

figure;
hold on;
axis equal;
grid on;
% 绘制 origin 点集
scatter(x_origin, y_origin, 10, 'b', 'filled', 'DisplayName', 'Origin Points');
% 绘制 final 点集
scatter(x_final, y_final, 10, 'r', 'filled', 'DisplayName', 'Final Points');
legend('Location','best');
title('Original & Final Point Sets');
hold off;