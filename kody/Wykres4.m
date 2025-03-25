%wykres błedów względnych dla całki z x^3 - 2*x^2 + x - 4 na przedziale [a,1], gdzie
%a należy do [0.0001, 0.5], dla dwóch różnych dokładności 1e-5 i 1e-3

% Przedziały integracji
a_values = linspace(0.0001, 0.5, 100);
b = 1;

% Analityczne rozwiązania
I_analytical = arrayfun(@(a) integral(f2, a, b), a_values);

% Numeryczne rozwiązania i błędy dla dokładności 1e-5 i 1e-3
rel_errors_1e5 = zeros(size(a_values));
rel_errors_1e3 = zeros(size(a_values));
for i = 1:length(a_values)
    I_numerical = accuracy_simpson_integration(f2, a_values(i), b, 1e-5);
    rel_errors_1e5(i) = abs(I_analytical(i) - I_numerical) / abs(I_analytical(i));
    I_numerical = accuracy_simpson_integration(f2, a_values(i), b, 1e-3);
    rel_errors_1e3(i) = abs(I_analytical(i) - I_numerical) / abs(I_analytical(i));
end

% Wykres z dwiema krzywymi
figure;
plot(a_values, rel_errors_1e5, 'r-', 'LineWidth', 3.5, 'DisplayName', 'Dokładność 1e-5');
hold on;
plot(a_values, rel_errors_1e3, 'b-', 'LineWidth', 1.5, 'DisplayName', 'Dokładność 1e-3');
xlabel('a (początek przedziału)', 'FontSize', 24);
ylabel('Błąd względny', 'FontSize', 24);
t = title('Błąd względny w metodzie Simpsona dla x^3 - 2*x^2 + x - 4 na [a,1] przy różnych dokładnościach', ...
          'FontSize', 22);

% Ustawienie jednostek tytułu na "normalized"
t.Units = 'normalized'; % Normalizacja położenia względem osi
t.Position(2) = 1.025;    % Przesunięcie tytułu w górę o 5% nad osiami

legend('FontSize', 18);
grid on;
