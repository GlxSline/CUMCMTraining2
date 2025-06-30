% 随机选3， 且第一个为偏移点
rand_number = randperm(8, 3);
coordinates_all = (1:8) * 2 *pi /9;

R_chosen = 100;
theta_chosen = coordinates_all(rand_number);
x_chosen = R_chosen .* cos(theta_chosen);
y_chosen = R_chosen .* sin(theta_chosen);

R_rand_max = 3;
R_rand = R_rand_max * rand();
theta_rand = 2 * pi * rand();

x_rand = x_chosen + R_rand * cos(theta_rand);
y_rand = y_chosen + R_rand * sin(theta_rand);

% 已知量
theta_O = atan2(-y_rand, -x_rand);
theta_A = atan2(-y_rand, R_chosen - x_rand);
theta_B = atan2(y_chosen(2) - y_rand, x_chosen(2) - x_rand);
theta_C = atan2(y_chosen(3) - y_rand, x_chosen(3) - x_rand);
