x_plane_now(13) = (x_plane_now(15) + x_plane_now(11)) / 2;

% 15->11
vector_15_11 = [x_plane_now(11) - x_plane_now(15), y_plane_now(11) - y_plane_now(15)];
d_15_11 = sqrt((x_plane_now(15) - x_plane_now(11)) ^ 2 + (y_plane_now(15) - y_plane_now(11)) ^ 2);
d_01_11 = sqrt((x_plane_now(01) - x_plane_now(11)) ^ 2 + (y_plane_now(01) - y_plane_now(11)) ^ 2);
d_15_01 = sqrt((x_plane_now(15) - x_plane_now(01)) ^ 2 + (y_plane_now(15) - y_plane_now(01)) ^ 2);

alpha_15_11_01 = acos((d_15_11 ^ 2 + d_01_11 ^ 2 - d_15_01 ^ 2) / (2 * d_15_11 * d_01_11));
alpha_11_01_11 = alpha_15_11_01 - pi / 3;
delta_11 = sin(alpha_11_01_11) * d_01_11 / sin(pi / 3);

vector_11 = vector_15_11 .* delta_11 ./ d_15_11;
x_plane_now(11) = x_plane_now(11) + vector_11(1);
y_plane_now(11) = y_plane_now(11) + vector_11(2);

alpha_11_15_01 = acos((d_15_11 ^ 2 + d_15_01 ^ 2 - d_01_11 ^ 2) / (2 * d_15_01 * d_15_11));
alpha_15_01_15 = alpha_11_15_01 - pi / 3;
delta_15 = sin(alpha_15_01_15) * d_15_01 / sin(pi / 3);

vector_15 = -1 .* vector_15_11 .* delta_15 ./ d_15_11;
x_plane_now(15) = x_plane_now(15) + vector_15(1);
y_plane_now(15) = y_plane_now(15) + vector_15(2);
