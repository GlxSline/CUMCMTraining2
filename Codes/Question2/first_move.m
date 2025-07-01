x_o_1_2_3 = (x_plane_now(1) + x_plane_now(2) + x_plane_now(3)) / 3;
y_o_1_2_3 = (y_plane_now(1) + y_plane_now(2) + y_plane_now(3)) / 3;
vector_o_1 = [x_plane_now(1) - x_o_1_2_3, y_plane_now(1) - y_o_1_2_3];
d_o_1 = sqrt((x_plane_now(1) - x_o_1_2_3) ^ 2 + (y_plane_now(1) - y_o_1_2_3) ^ 2);

d_01_02 = sqrt((x_plane_now(1) - x_plane_now(2)) ^ 2 + (y_plane_now(1) - y_plane_now(2)) ^ 2);
d_01_03 = sqrt((x_plane_now(1) - x_plane_now(3)) ^ 2 + (y_plane_now(1) - y_plane_now(3)) ^ 2);
d_02_03 = sqrt((x_plane_now(2) - x_plane_now(3)) ^ 2 + (y_plane_now(2) - y_plane_now(3)) ^ 2);
d_01 = (d_01_03 + d_01_02) / 2;

alpha_02_01_03 = acos((d_01_02 ^ 2 + d_01_03 ^ 2 - d_02_03 ^ 2) / (2 * d_01_02 * d_01_03));
delta_d_01 = 50 * cos(pi / 6) - d_01 * cos(alpha_02_01_03 / 2);

vector_01 = vector_o_1 .* delta_d_01 ./ d_o_1;
x_plane_now(1) = x_plane_now(1) + vector_01(1);
y_plane_now(1) = y_plane_now(1) + vector_01(2);

%!

x_o_11_7_12 = (x_plane_now(11) + x_plane_now(7) + x_plane_now(12)) / 3;
y_o_11_7_12 = (y_plane_now(11) + y_plane_now(7) + y_plane_now(12)) / 3;
vector_o_11 = [x_plane_now(11) - x_o_11_7_12, y_plane_now(11) - y_o_11_7_12];
d_o_11 = sqrt((x_plane_now(11) - x_o_11_7_12) ^ 2 + (y_plane_now(11) - y_o_11_7_12) ^ 2);

d_11_07 = sqrt((x_plane_now(11) - x_plane_now(7)) ^ 2 + (y_plane_now(11) - y_plane_now(7)) ^ 2);
d_11_12 = sqrt((x_plane_now(11) - x_plane_now(12)) ^ 2 + (y_plane_now(11) - y_plane_now(12)) ^ 2);
d_07_12 = sqrt((x_plane_now(7) - x_plane_now(12)) ^ 2 + (y_plane_now(7) - y_plane_now(12)) ^ 2);
d_11 = (d_11_12 + d_11_07) / 2;

alpha_07_11_12 = acos((d_11_07 ^ 2 + d_11_12 ^ 2 - d_07_12 ^ 2) / (2 * d_11_07 * d_11_12));
delta_d_11 = 50 * cos(pi / 6) - d_11 * cos(alpha_07_11_12 / 2);

vector_11 = vector_o_11 .* delta_d_11 ./ d_o_11;
x_plane_now(11) = x_plane_now(11) + vector_01(1);
y_plane_now(11) = y_plane_now(11) + vector_01(2);

%!

x_o_15_10_14 = (x_plane_now(15) + x_plane_now(10) + x_plane_now(14)) / 3;
y_o_15_10_14 = (y_plane_now(15) + y_plane_now(10) + y_plane_now(14)) / 3;
vector_o_15 = [x_plane_now(15) - x_o_15_10_14, y_plane_now(15) - y_o_15_10_14];
d_o_15 = sqrt((x_plane_now(15) - x_o_15_10_14) ^ 2 + (y_plane_now(15) - y_o_15_10_14) ^ 2);

d_15_10 = sqrt((x_plane_now(15) - x_plane_now(10)) ^ 2 + (y_plane_now(15) - y_plane_now(10)) ^ 2);
d_15_14 = sqrt((x_plane_now(15) - x_plane_now(14)) ^ 2 + (y_plane_now(15) - y_plane_now(14)) ^ 2);
d_10_14 = sqrt((x_plane_now(10) - x_plane_now(14)) ^ 2 + (y_plane_now(10) - y_plane_now(14)) ^ 2);
d_15 = (d_15_14 + d_15_10) / 2;

alpha_10_15_14 = acos((d_15_10 ^ 2 + d_15_14 ^ 2 - d_10_14 ^ 2) / (2 * d_15_10 * d_15_14));
delta_d_15 = 50 * cos(pi / 6) - d_15 * cos(alpha_10_15_14 / 2);

vector_15 = vector_o_15 .* delta_d_15 ./ d_o_15;
x_plane_now(15) = x_plane_now(15) + vector_01(1);
y_plane_now(15) = y_plane_now(15) + vector_01(2);