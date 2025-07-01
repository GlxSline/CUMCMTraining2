function value = calculate_value(x_plane_now, y_plane_now, x_plane, y_plane)
    value = 0;

    for i = 1:numel(x_plane_now)
        value = value + (x_plane_now(i) - x_plane(i)) ^ 2 + (y_plane_now(i) - y_plane(i)) ^ 2;

    end

    value = value / numel(x_plane_now);

end
