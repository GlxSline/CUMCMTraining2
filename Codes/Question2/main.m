simulation_times = 100000;
value_number = zeros(1, simulation_times);

for i = 1:simulation_times

    generate_point;

    % % 调 1, 11, 15
    % second_move;

    % % 调11, 13, 15
    % first_move;

    % 调 1, 11, 15
    second_move;

    % 调 2,4,7; 3,6,10; 12,13,14;
    third_move;

    % 调 5, 8, 9
    fourth_move;

    value_number(i) = calculate_value(x_plane_now, y_plane_now, x_plane, y_plane);

end
max_value = max(value_number);
min_value = min(value_number);
average_value = sum(value_number) / numel(value_number);