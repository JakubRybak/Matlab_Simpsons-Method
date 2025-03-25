%Tutaj sa wyliczone wszystkie błedy i rzeczy potrzebne do wizualizacji
% Funkcje testowe (uchwyty funkcji)
f1 = @(x) sin(1./x);  
f2 = @(x) x.^3 - 2.*x.^2 + x - 4;
f3 = @(x) sin(2*x) - cos(x);
f4 = @(x) exp(-x.^2);
f5 = @(x) 1./x;
f6 = @(x) cos(10*x);

% Analityczne rozwiązania
I_f1_analityczne = integral(f1, 0.001, 0.3); % Całka z sin(1/x) w [0.001, 0.3]
I_f2_analityczne = integral(f2, 1, 5);       % Całka z x^3 - 2x^2 + x - 4 w [1, 5]
I_f3_analityczne = integral(f3, 1, 4);       % Całka z sin(2x) - cos(x) w [1, 4]
I_f4_analityczne = integral(f4, 2, 3);       % Całka z exp(-x^2) w [2, 3]
I_f5_analityczne = integral(f5, 0.001, 1);   % Całka z 1/x w [0.001, 1]
I_f6_analityczne = integral(f6, 0, 1);       % Całka z cos(10x) w [0, 1]

% Tolerancje
d1 = 1e-1;
d2 = 1e-3;
d3 = 1e-5;

% Testowanie funkcji f1
I_f1_num_1 = accuracy_simpson_integration(f1, 0.001, 0.3, d1);
I_f1_num_2 = accuracy_simpson_integration(f1, 0.001, 0.3, d2);
I_f1_num_3 = accuracy_simpson_integration(f1, 0.001, 0.3, d3);

% Testowanie funkcji f2
I_f2_num_1 = accuracy_simpson_integration(f2, 1, 5, d1);
I_f2_num_2 = accuracy_simpson_integration(f2, 1, 5, d2);
I_f2_num_3 = accuracy_simpson_integration(f2, 1, 5, d3);

% Testowanie funkcji f3
I_f3_num_1 = accuracy_simpson_integration(f3, 1, 4, d1);
I_f3_num_2 = accuracy_simpson_integration(f3, 1, 4, d2);
I_f3_num_3 = accuracy_simpson_integration(f3, 1, 4, d3);

% Testowanie funkcji f4
I_f4_num_1 = accuracy_simpson_integration(f4, 2, 3, d1);
I_f4_num_2 = accuracy_simpson_integration(f4, 2, 3, d2);
I_f4_num_3 = accuracy_simpson_integration(f4, 2, 3, d3);

% Testowanie funkcji f5
I_f5_num_1 = accuracy_simpson_integration(f5, 0.001, 1, d1);
I_f5_num_2 = accuracy_simpson_integration(f5, 0.001, 1, d2);
I_f5_num_3 = accuracy_simpson_integration(f5, 0.001, 1, d3);

% Testowanie funkcji f6
I_f6_num_1 = accuracy_simpson_integration(f6, 0, 1, d1);
I_f6_num_2 = accuracy_simpson_integration(f6, 0, 1, d2);
I_f6_num_3 = accuracy_simpson_integration(f6, 0, 1, d3);


% Obliczanie błędów numerycznych dla każdej funkcji
% f1
errors_f1 = abs(I_f1_analityczne - [I_f1_num_1, I_f1_num_2, I_f1_num_3]);
rel_errors_f1 = errors_f1 / abs(I_f1_analityczne);
sq_errors_f1 = sqrt(sum(([I_f1_num_1, I_f1_num_2, I_f1_num_3] - I_f1_analityczne).^2));

% f2
errors_f2 = abs(I_f2_analityczne - [I_f2_num_1, I_f2_num_2, I_f2_num_3]);
rel_errors_f2 = errors_f2 / abs(I_f2_analityczne);
sq_errors_f2 = sqrt(sum(([I_f2_num_1, I_f2_num_2, I_f2_num_3] - I_f2_analityczne).^2));

% f3
errors_f3 = abs(I_f3_analityczne - [I_f3_num_1, I_f3_num_2, I_f3_num_3]);
rel_errors_f3 = errors_f3 / abs(I_f3_analityczne);
sq_errors_f3 = sqrt(sum(([I_f3_num_1, I_f3_num_2, I_f3_num_3] - I_f3_analityczne).^2));

% f4
errors_f4 = abs(I_f4_analityczne - [I_f4_num_1, I_f4_num_2, I_f4_num_3]);
rel_errors_f4 = errors_f4 / abs(I_f4_analityczne);
sq_errors_f4 = sqrt(sum(([I_f4_num_1, I_f4_num_2, I_f4_num_3] - I_f4_analityczne).^2));

% f5
errors_f5 = abs(I_f5_analityczne - [I_f5_num_1, I_f5_num_2, I_f5_num_3]);
rel_errors_f5 = errors_f5 / abs(I_f5_analityczne);
sq_errors_f5 = sqrt(sum(([I_f5_num_1, I_f5_num_2, I_f5_num_3] - I_f5_analityczne).^2));

% f6
errors_f6 = abs(I_f6_analityczne - [I_f6_num_1, I_f6_num_2, I_f6_num_3]);
rel_errors_f6 = errors_f6 / abs(I_f6_analityczne);
sq_errors_f6 = sqrt(sum(([I_f6_num_1, I_f6_num_2, I_f6_num_3] - I_f6_analityczne).^2));