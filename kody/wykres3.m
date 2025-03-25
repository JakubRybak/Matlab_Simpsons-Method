%wykres błedów względnych dla całki z cos(10x) na przedziale [0.001,1] w
%zależności od dokładności

% Przedział całkowania
a = 0.001;
b = 1;

% Dokładności do przetestowania
accuracies = logspace(-6, 0, 100);

% Analityczne rozwiązanie
I_analytical = integral(f6, a, b);

% Numeryczne rozwiązania i błędy względne
rel_errors = zeros(size(accuracies));
for i = 1:length(accuracies)
    I_numerical = accuracy_simpson_integration(f6, a, b, accuracies(i));
    rel_errors(i) = abs(I_analytical - I_numerical) / abs(I_analytical);
end

% Wykres błędów względnych
figure;
semilogx(accuracies, rel_errors, 'b-', 'LineWidth', 1.5);
xlabel('Dokładność', 'FontSize', 24);
ylabel('Błąd względny', 'FontSize', 24);
title('Błąd względny metody Simpsona dla cos(10x) na [0.001, 1] w zależności od dokładności', 'FontSize', 26);
grid on;