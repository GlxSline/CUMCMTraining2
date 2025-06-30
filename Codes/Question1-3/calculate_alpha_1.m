function alpha_1 = calculate_alpha_1(rho_now, theta_now, R)
    x = rho_now .* cos(theta_now);
    y = rho_now .* sin(theta_now);
    % alpha_1 = acos(((x_now ^ 2 + y_now ^ 2) + ((x_now - R) ^ 2 + y_now ^ 2) - R ^ 2) ...
    %     / (2 * sqrt(x_now ^ 2 + y_now ^ 2) * sqrt((x_now - R) ^ 2 + y_now ^ 2)));
    d1 = sqrt(x .^ 2 + y .^ 2);
    d2 = sqrt((x - R) .^ 2 + y .^ 2);
    % 余弦定理
    cos_val = (d1 .^ 2 + d2 .^ 2 - R .^ 2) ./ (2 * d1 .* d2);
    alpha_1 = acos(cos_val);

end