function [rho_change, theta_change] = move_point(source_numb, rho_now, theta_now, receive_number)
    R = 100;
    x_r = rho_now(receive_number) * cos(theta_now(receive_number));
    y_r = rho_now(receive_number) * sin(theta_now(receive_number));
    x_s = rho_now(source_numb) * cos(theta_now(source_numb));
    y_s = rho_now(source_numb) * sin(theta_now(source_numb));

    d_or = sqrt(x_r ^ 2 + y_r ^ 2);
    d_sr = sqrt((x_r - x_s) ^ 2 + (y_r - y_s) ^ 2);
    d_ar = sqrt((x_r - 100) ^ 2 + y_r ^ 2);
    d_sa = sqrt((x_s - 100) ^ 2 + y_s ^ 2);

    alpha_oa = acos((d_or ^ 2 + d_ar ^ 2 - R ^ 2) / (2 * d_or * d_ar));
    alpha_os = acos((d_or ^ 2 + d_sr ^ 2 - R ^ 2) / (2 * d_or * d_sr));
    alpha_as = acos((d_ar ^ 2 + d_sr ^ 2 - d_sa ^ 2) / (2 * d_ar * d_sr));
    % theta = (theta_now(receive_number) > pi) * (2 * pi - theta_now(receive_number)) ...
    % + (theta_now(receive_number) <= pi) * theta_now(receive_number);

    beta = acos((d_sa ^ 2) / (2 * R * d_sa));

    if (abs(alpha_os - alpha_as - alpha_oa) < 1e-6) || (abs(alpha_oa - alpha_os - alpha_as) < 1e-6)
        tan_theta = (-2 * cos(beta) * sin(alpha_oa) * sin(alpha_oa + alpha_as + beta)) / ...
            (sin(alpha_as) + 2 * cos(beta) * sin(alpha_oa) * cos(alpha_oa + alpha_as + beta));

        % theta = atan2(tan_theta, 1) * (x_r >= 0) + atan2(tan_theta, -1) * (x_r < 0);

    elseif (abs(alpha_as - alpha_oa - alpha_os) < 1e-6) && alpha_as > (pi / 2)
        tan_theta = (2 * cos(beta) * sin(alpha_oa) * sin(beta - alpha_os)) / ...
            (sin(alpha_as) - 2 * cos(beta) * sin(alpha_oa) * cos(beta - alpha_os));
        % theta = atan2(tan_theta, 1) * (x_r >= 0) + atan2(tan_theta, -1) * (x_r < 0);

    else
        tan_theta = (-2 * cos(beta) * sin(alpha_oa) * sin(beta + alpha_os)) / ...
            (sin(alpha_as) - 2 * cos(beta) * sin(alpha_oa) * cos(beta + alpha_os));
        % theta = atan2(tan_theta, 1) * (x_r >= 0) + atan2(tan_theta, -1) * (x_r < 0);

    end

    if y_r > 0

        if tan_theta >= 0
            theta = atan2(tan_theta, 1);
            theta_i = theta;
        else
            theta = pi + atan2(tan_theta, 1);
            theta_i = theta;
        end

    elseif y_r < 0

        if tan_theta >= 0
            theta = 2 * pi - atan2(tan_theta, 1);
            theta_i = 2 * pi - theta;
        else
            theta = pi - atan2(tan_theta, 1);
            theta_i = 2 * pi - theta;
        end

    end
    rho = R * sin(theta_i + alpha_oa) / sin(alpha_oa);
    theta_end = receive_number * 2 * pi / 9;
    delta_rho = 100 - rho;
    delta_theta = theta_end - theta;
    rho_change = rho_now;
    rho_change(receive_number) = rho_now(receive_number) + delta_rho;
    theta_change = theta_now;
    theta_change(receive_number) = theta_now(receive_number) + delta_theta;

end
