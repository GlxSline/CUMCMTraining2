

alpha_1 = zeros(1, 8);
alpha_2 = pi / 2 - pi ./ 9 .* [(linspace(1, 4, 4)), (linspace(4, 1, 4))];

for i = 1:8
    alpha_1(i) = calculate_alpha_1(rho_now(i), theta_now(i), rho_last(i));
end

while max(abs(alpha_1 - alpha_2)) > 0.01

    for i = 1:8

        if alpha_1(i) - alpha_2(i) > 0.01
            rho_now(i) = rho_now(i) + 1;
        elseif alpha_1(i) - alpha_2(i) < -0.01
            rho_now(i) = rho_now(i) - 1;
        end

        alpha_1(i) = calculate_alpha_1(rho_now(i), theta_now(i), rho_last(i));

    end

    move_number = move_number + 1;

end

% theta_now = alpha_1;
