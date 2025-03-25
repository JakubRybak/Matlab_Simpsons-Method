%wykres błedów względnych dla całki z sin(1/x) na przedziale [0.001,b], gdzie
%b należy do [0.2, 1], dla dwóch różnych dokładności 1e-5 i 1e-3

% Stała dolna granica całkowania
a = 0.001;

% Zmienne górne granice całkowania
b_values = linspace(0.2, 1, 100);

% Analityczne rozwiązania
I_analytical = arrayfun(@(b) integral(f5, a, b), b_values);

% Numeryczne rozwiązania i błędy względne dla dokładności 1e-5 i 1e-3
rel_errors_1e5 = zeros(size(b_values));
rel_errors_1e1 = zeros(size(b_values));
for i = 1:length(b_values)
    I_numerical = accuracy_simpson_integration(f5, a, b_values(i), 1e-5);
    rel_errors_1e5(i) = abs(I_analytical(i) - I_numerical) / abs(I_analytical(i));
    I_numerical = accuracy_simpson_integration(f5, a, b_values(i), 1e-1);
    rel_errors_1e1(i) = abs(I_analytical(i) - I_numerical) / abs(I_analytical(i));
end


% Wykres z dwiema krzywymi
figure;
plot(b_values, rel_errors_1e5, 'r-', 'LineWidth', 1.5, 'DisplayName', 'Dokładność 1e-5');
hold on;
plot(b_values, rel_errors_1e1, 'b-', 'LineWidth', 1.5, 'DisplayName', 'Dokładność 1e-1');
xlabel('b (koniec przedziału)', 'FontSize', 24);
ylabel('Błąd względny (w skali logarytmicznej)', 'FontSize', 24);
title('Błąd względny w metodzie Simpsona dla 1/x na [0.001, b] przy różnych dokładnościach', 'FontSize', 26);
legend show;
legend('FontSize', 18);
grid on;
set(gca, 'YScale', 'log');  % Skala logarytmiczna na osi Y