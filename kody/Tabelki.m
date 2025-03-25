%Tabele
%Tutaj są tworzone tabele

% Tworzenie pierwszej tabeli
funkcje_dla_ktorych_dziala_gorzej = table( ...
    {'sin(1/x) [0.001, 0.3]'; '1/x [0.001, 1]'; 'cos(10x) [0, 1]'}, ...
    [I_f1_analityczne; I_f5_analityczne; I_f6_analityczne], ...
    [I_f1_num_1; I_f5_num_1; I_f6_num_1], ...
    [I_f1_num_2; I_f5_num_2; I_f6_num_2], ...
    [I_f1_num_3; I_f5_num_3; I_f6_num_3], ...
    [errors_f1(1); errors_f5(1); errors_f6(1)], ...
    [errors_f1(2); errors_f5(2); errors_f6(2)], ...
    [errors_f1(3); errors_f5(3); errors_f6(3)], ...
    [rel_errors_f1(1); rel_errors_f5(1); rel_errors_f6(1)], ...
    [rel_errors_f1(2); rel_errors_f5(2); rel_errors_f6(2)], ...
    [rel_errors_f1(3); rel_errors_f5(3); rel_errors_f6(3)], ...
    [sq_errors_f1; sq_errors_f5; sq_errors_f6], ...
    'VariableNames', {'Funkcja', 'Wynik dokładny', 'Wynik δ=1e-1', 'Wynik δ=1e-3', 'Wynik δ=1e-5', ...
                      'Błąd δ=1e-1', 'Błąd δ=1e-3', 'Błąd δ=1e-5', ...
                      'B. względny δ=1e-1', 'B. względny δ=1e-3', 'B. względny δ=1e-5', ...
                      'Błąd kwadratowy'});

% Tworzenie drugiej tabeli
funkcje_dla_ktorych_dobrze_dziala = table( ...
    {'x^3 - 2*x^2 + x - 4 [1, 5]'; 'sin(2x) - cos(x) [1, 4]'; 'exp(-x^2) [2, 3]'}, ...
    [I_f2_analityczne; I_f3_analityczne; I_f4_analityczne], ...
    [I_f2_num_1; I_f3_num_1; I_f4_num_1], ...
    [I_f2_num_2; I_f3_num_2; I_f4_num_2], ...
    [I_f2_num_3; I_f3_num_3; I_f4_num_3], ...
    [errors_f2(1); errors_f3(1); errors_f4(1)], ...
    [errors_f2(2); errors_f3(2); errors_f4(2)], ...
    [errors_f2(3); errors_f3(3); errors_f4(3)], ...
    [rel_errors_f2(1); rel_errors_f3(1); rel_errors_f4(1)], ...
    [rel_errors_f2(2); rel_errors_f3(2); rel_errors_f4(2)], ...
    [rel_errors_f2(3); rel_errors_f3(3); rel_errors_f4(3)], ...
    [sq_errors_f2; sq_errors_f3; sq_errors_f4], ...
    'VariableNames', {'Funkcja', 'Wynik dokładny', 'Wynik δ=1e-1', 'Wynik δ=1e-3', 'Wynik δ=1e-5', ...
                      'Błąd δ=1e-1', 'Błąd δ=1e-3', 'Błąd δ=1e-5', ...
                      'B. względny δ=1e-1', 'B. względny δ=1e-3', 'B. względny δ=1e-5', ...
                      'Błąd kwadratowy'});

% Wyświetlanie wyników pierwszej tabeli
display("funkcje dla ktorych dziala gorzej")
disp(funkcje_dla_ktorych_dziala_gorzej);
% Wyświetlanie wyników drugiej tabeli
display("funkcje dla ktorych dobrze dziala")
disp(funkcje_dla_ktorych_dobrze_dziala);
