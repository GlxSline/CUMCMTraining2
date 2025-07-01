% function [x, y] = polar_point_on_circle(cx, cy, r, theta)
%     % 根据圆心坐标、半径和相对原点的极角求圆上点的坐标
%     %
%     % 输入参数：
%     %   cx, cy  - 圆心坐标
%     %   r       - 圆的半径
%     %   theta   - 圆上某点相对原点(0,0)的极角 (弧度制)
%     %
%     % 输出参数：
%     %   x, y    - 圆上该点的坐标
%     %
%     % 原理：
%     %   设圆上点为(x,y)，该点相对原点的极角为theta
%     %   则 x = ρ*cos(theta), y = ρ*sin(theta)
%     %   同时该点在圆上：(x-cx)² + (y-cy)² = r²
%     %   解得ρ的值，进而求出x,y

%     % 计算极径ρ的系数
%     a = 1; % ρ²的系数
%     b = -2 .* (cx .* cos(theta) + cy .* sin(theta)); % ρ的系数
%     c = cx .^ 2 + cy .^ 2 - r .^ 2; % 常数项

%     % 计算判别式
%     discriminant = b .^ 2 - 4 .* a .* c;

%     % if discriminant < 0
%     %     error('射线与圆无交点');
%     % end

%     % 求解ρ (取两个解中距离原点较近的)
%     rho1 = (-b + sqrt(discriminant)) ./ (2 .* a);
%     rho2 = (-b - sqrt(discriminant)) ./ (2 .* a);

%     % 选择正的且较小的ρ值
%     valid_rhos = [rho1, rho2];
%     valid_rhos = valid_rhos(valid_rhos >= 0);

%     % if isempty(valid_rhos)
%     %     error('无有效解');
%     % end

%     rho = min(valid_rhos);

%     % 计算坐标
%     x = rho .* cos(theta);
%     y = rho .* sin(theta);

%     % % 验证结果是否在圆上
%     % dist_to_center = sqrt((x - cx)^2 + (y - cy)^2);
%     % if abs(dist_to_center - r) > 1e-10
%     %     warning('计算结果可能不准确');
%     % end
% end

% function [x, y] = polar_point_on_circle(cx, cy, r, theta)
%     % 修复版本
%     a = 1;
%     b = -2 .* (cx .* cos(theta) + cy .* sin(theta));
%     c = cx .^ 2 + cy .^ 2 - r .^ 2;

%     discriminant = b .^ 2 - 4 .* a .* c;

%     % 检查判别式
%     if any(discriminant < 0)
%         warning('某些角度无解');
%     end

%     rho1 = (-b + sqrt(max(discriminant, 0))) ./ (2 .* a);
%     rho2 = (-b - sqrt(max(discriminant, 0))) ./ (2 .* a);

%     % 选择正值且合理的解
%     rho = zeros(size(theta));
%     for i = 1:numel(theta)
%         candidates = [rho1(i), rho2(i)];
%         valid_candidates = candidates(candidates >= 0 & isreal(candidates));
%         if ~isempty(valid_candidates)
%             rho(i) = min(valid_candidates);
%         end
%     end

%     x = rho .* cos(theta);
%     y = rho .* sin(theta);
% end

function [x, y] = polar_point_on_circle(center, angles)
    % 根据圆心、半径和相对于原点(0,0)的极角计算圆上点的坐标
    % 输入:
    %   center - 圆心坐标 [cx, cy]
    %   radius - 圆的半径
    %   angles - 相对于原点的极角数组（弧度制）
    % 输出:
    %   x, y - 圆上各点的x,y坐标数组

    % cx = center(1);
    % cy = center(2);

    % x = zeros(size(angles));
    % y = zeros(size(angles));

    % for i = 1:length(angles)
    %     theta = angles(i);

    %     % 求解二次方程: ρ² - 2ρ(cx*cos(θ) + cy*sin(θ)) + (cx² + cy² - r²) = 0
    %     a = 1;
    %     b = -2 * (cx * cos(theta) + cy * sin(theta));
    %     c = cx^2 + cy^2 - radius^2;

    %     discriminant = b^2 - 4*a*c;

    %     if discriminant < 0
    %         % warning('第%d个角度无解：圆与射线不相交', i);
    %         x(i) = NaN;
    %         y(i) = NaN;
    %     else
    %         % 计算两个可能的距离值
    %         rho1 = (-b + sqrt(discriminant)) / (2*a);
    %         rho2 = (-b - sqrt(discriminant)) / (2*a);

    %         % 选择正值且较小的解（通常是我们想要的）
    %         if rho1 > 0 && rho2 > 0
    %             rho = min(rho1, rho2);
    %         elseif rho1 > 0
    %             rho = rho1;
    %         elseif rho2 > 0
    %             rho = rho2;
    %         else
    %             % warning('第%d个角度无有效解', i);
    %             x(i) = NaN;
    %             y(i) = NaN;
    %             continue;
    %         end

    %         % 计算坐标
    %         x(i) = rho * cos(theta);
    %         y(i) = rho * sin(theta);
    %     end
    % end

    cx = center(1);
    cy = center(2);

    % 预分配数组
    x = zeros(size(angles));
    y = zeros(size(angles));

    for i = 1:length(angles)
        theta = angles(i);

        % 对于过原点的圆，另一个交点的极径为：
        % ρ = 2(cx*cos(θ) + cy*sin(θ))
        rho = 2 * (cx * cos(theta) + cy * sin(theta));

        if rho <= 0
            % 如果极径≤0，说明在该角度方向上没有有效的交点
            % warning('第%d个角度在射线方向上无有效交点', i);
            x(i) = NaN;
            y(i) = NaN;
        else
            % 计算坐标
            x(i) = rho * cos(theta);
            y(i) = rho * sin(theta);
        end

    end

end
