function error_number = calculate_error(rho_now, rho_last, theta_now, theta_last)
    x_now = rho_now .* cos(theta_now);
    x_last = rho_last .* cos(theta_last);
    y_now = rho_now .* sin(theta_now);
    y_last = rho_last .* sin(theta_last);

    error_number = 0;

    for i = 1:numel(x_now)
        error_number = error_number + (x_now(i) - x_last(i)) ^ 2 + (y_now(i) - y_last(i)) ^ 2;
    end

    error_number = error_number / numel(x_now);

end
