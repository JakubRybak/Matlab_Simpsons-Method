%wykres błedów względnych dla całki z sin(1/x) na przedziale [a,1], gdzie
%a należy do [0.0001, 0.5], dla dwóch różnych dokładności 1e-5 i 1e-3

% Przedziały integracji
a_values = linspace(0.0001, 0.5, 100);
b = 1;

% Analityczne rozwiązania
I_analytical = arrayfun(@(a) integral(f1, a, b), a_values);

% Numeryczne rozwiązania i błędy dla dokładności 1e-5 i 1e-3
rel_errors_1e5 = zeros(size(a_values));
rel_errors_1e3 = zeros(size(a_values));
for i = 1:length(a_values)
    I_numerical = accuracy_simpson_integration(f1, a_values(i), b, 1e-5);
    rel_errors_1e5(i) = abs(I_analytical(i) - I_numerical) / abs(I_analytical(i));
    I_numerical = accuracy_simpson_integration(f1, a_values(i), b, 1e-3);
    rel_errors_1e3(i) = abs(I_analytical(i) - I_numerical) / abs(I_analytical(i));
end

% Wykres z dwiema krzywymi
figure;
plot(a_values, rel_errors_1e5, 'r-', 'LineWidth', 1.5, 'DisplayName', 'Dokładność 1e-5');
hold on;
plot(a_values, rel_errors_1e3, 'b-', 'LineWidth', 1.5, 'DisplayName', 'Dokładność 1e-3');
xlabel('a (początek przedziału)', 'FontSize', 24);
ylabel('Błąd względny (w skali logarytmicznej)', 'FontSize', 24);
title('Błąd względny w metodzie Simpsona dla sin(1/x) na [a,1] przy różnych dokładnościach', 'FontSize', 26);
legend show;
legend('FontSize', 18);
grid on;
set(gca, 'YScale', 'log');  % Skala logarytmiczna na osi Y