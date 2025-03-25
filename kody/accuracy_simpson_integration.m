function I = accuracy_simpson_integration(fun, a, b, d)
% ACCURACY_SIMPSON_INTEGRATION Oblicza przybliżoną wartość całki za pomocą wzoru Simpsona
    %   z adaptacyjną liczbą przedziałów, tak aby różnica pomiędzy kolejnymi
    %   przybliżeniami była mniejsza niż zdefiniowana dokładność d.
    %   
    %   I = ACCURACY_SIMPSON_INTEGRATION(fun, a, b, d) oblicza przybliżoną wartość całki
    %   funkcji 'fun' na przedziale [a, b] przy użyciu wzoru Simpsona. Funkcja adaptacyjnie
    %   zwiększa liczbę przedziałów N, aż różnica pomiędzy kolejnymi przybliżeniami będzie
    %   mniejsza niż wartość zadanego kryterium dokładności 'd'.
    %
    %   Argumenty:
    %     fun - funkcja do całkowania, zadeklarowana jako uchwyt funkcji, np. @(x) x.^2
    %     a   - początek przedziału całkowania (a < b)
    %     b   - koniec przedziału całkowania (a < b)
    %     d   - dokładność, którą chcemy uzyskać (różnica pomiędzy kolejnymi przybliżeniami)
    %
    %   Wynik:
    %     I   - przybliżona wartość całki obliczona za pomocą wzoru Simpsona, z osiągniętą
    %           wymaganą dokładnością.
    %
    %   Przykład:
    %     f = @(x) x.^2;  % Funkcja do całkowania
    %     I = accuracy_simpson_integration(f, 0, 1, 1e-6);
    %     disp(I);  % Wyświetli przybliżoną wartość całki z funkcji x^2 na przedziale [0, 1]
    %
    %   Uwagi:
    %     - Funkcja adaptacyjnie zwiększa liczbę przedziałów N, aż różnica między kolejnymi
    %       przybliżeniami będzie mniejsza niż zadana dokładność d.
    %     - Proces kończy się, gdy warunek dokładności jest spełniony.
    
    n = 2;
    f0 = simpson_integration(fun,a,b,n);
    n = n * 2;
    f1 = simpson_integration(fun,a,b,n);

    while abs(f1 - f0) > d
        n = n * 2;
        f0 = f1;
        f1 = simpson_integration(fun,a,b,n);
    end
    I = f1;
end