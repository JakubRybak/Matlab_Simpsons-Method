function I = simpson_integration(fun, a, b, N)
    % SIMPSON_INTEGRATION Oblicza przybliżenie całki określonej za pomocą wzoru Simpsona.
    %   I = SIMPSON_INTEGRATION(fun, a, b, N) oblicza przybliżoną wartość całki
    %   funkcji 'fun' na przedziale [a, b] z użyciem wzoru Simpsona.
    %   Argumenty:
    %     fun - funkcja do całkowania, zadeklarowana jako uchwyt funkcji, np. @(x) x.^2
    %     a   - początek przedziału całkowania (a < b)
    %     b   - koniec przedziału całkowania (a < b)
    %     N   - liczba podprzedziałów (N musi być liczbą parzystą)
    %
    %   Wynik:
    %     I   - przybliżona wartość całki obliczona za pomocą wzoru Simpsona.
    %
    %   Przykład:
    %     f = @(x) x.^2;  % Funkcja do całkowania
    %     I = simpson_integration(f, 0, 1, 4);
    %     disp(I);  % Wyświetli przybliżoną wartość całki z funkcji x^2 na przedziale [0, 1]
    %
    %   Uwagi:
    %     - Funkcja wymaga, aby N było liczbą parzystą. Jeśli N jest liczbą nieparzystą,
    %       funkcja zgłosi błąd.
    %     - Jeśli przedział jest źle określony (a >= b), funkcja zgłosi błąd.

    % Sprawdzamy, czy liczba przedziałów N jest liczbą parzystą
    if mod(N, 2) == 1
        error('Liczba przedziałów N musi być liczbą parzystą');
    end
    %Sprawdzamy czy przedzial jest dobry
    if a>= b
        error('Zły przedzial');
    end

    % Oblicz długość jednego podprzedziału
    H = (b - a) / N;
    % Inicjalizujemy sumy
    sum_even = 0; % suma dla punktów a + kH
    sum_mid = 0;  % suma dla punktów a + kH + H/2
    
    % Suma dla k = 1,2,...,N-1 dla punktów a + kH
    xk = a + H;
    for k = 1:N-1
        sum_even = sum_even + fun(xk); 
        xk = xk + H;
    end
    % Suma dla k = 0,1,2,...,N-1 dla punktów a + kH +H/2
    xk = a + H/2;
    for k = 0:N-1
        sum_mid = sum_mid + fun(xk);
        xk = xk + H;
    end
    % Obliczamy wartość całki na podstawie wzoru Simpsona
    I = (H / 6) * (fun(a) + fun(b) + 2 * sum_even + 4 * sum_mid);
end
