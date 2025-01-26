
function main
    % Konstant för h-bar och ljusets hastighet
    hbar = 1; % Sätt h-bar = 1 i dimensionslösa enheter
    c = 3e8; % Ljusets hastighet i m/s
    nm_to_m = 1e-9; % Nanometer till meter

    % Givna våglängder i meter
    lambda_target_1 = 431 * nm_to_m; % För första optimering (fmax)
    lambda_target_2 = 790 * nm_to_m; % För andra optimering (fmin)
    lambda_target_3 = 593 * nm_to_m; % För medelvärde (fmid) justerat

    % Diskretisering
    N = 1000; % Antal punkter i diskretiseringen
    Delta = 1e-9; % Initial värde för avstånd
    x = linspace(-Delta, Delta, N); % Justera x till att sträcka sig från -a till a

    % Optimeringsfunktion för att matcha våglängder
    options = optimset('Display', 'iter', 'TolFun', 1e-6, 'TolX', 1e-6);

    % Målfunktion som tar in [a, fmax, fmin] som parametrar
    objFun = @(p) match_wavelengths(p, x, N, hbar, c, lambda_target_1, lambda_target_2, lambda_target_3);

    % Startgissningar för [a, fmax, fmin]
    p0 = [1e-9, 35, 25]; % Justerade gissningar för fmax och fmin

    % Begränsningar
    lb = [1e-10, 30, 20]; % Nedre gränser: a > 0, fmax >= 30, fmin >= 20
    ub = [1e-8, 40, 35]; % Övre gränser: a < 1e-8, fmax <= 40, fmin <= 35

    % Optimering med begränsningar
    p_opt = fmincon(objFun, p0, [], [], [], [], lb, ub, [], options);

    % Optimala värden för a, fmax och fmin
    a_opt = p_opt(1);
    fmax_opt = p_opt(2);
    fmin_opt = p_opt(3);
    fmid_opt = (fmax_opt + fmin_opt) / 2;

    fprintf('Optimalt a = %.3e m\n', a_opt);
    fprintf('Optimalt fmax = %.3f\n', fmax_opt);
    fprintf('Optimalt fmin = %.3f\n', fmin_opt);
    fprintf('Optimalt fmid = %.3f\n', fmid_opt);
end

% Funktionsdefinition för att matcha våglängder
function error = match_wavelengths(p, x, N, hbar, c, lambda_target_1, lambda_target_2, lambda_target_3)
    a = p(1); % Skala
    fmax = p(2); % Potentialparameter för lambda = 431 nm (fmax)
    fmin = p(3); % Potentialparameter för lambda = 790 nm (fmin)
    
    % Ny diskretisering baserat på a
    x_min = -a; x_max = a; 
    x = linspace(x_min, x_max, N); % Justera x till att sträcka sig från -a till a
    Delta = x(2) - x(1);
    
    % Ny tridiagonal matris
    T = diag(2 * ones(N, 1)) + diag(-1 * ones(N - 1, 1), 1) + diag(-1 * ones(N - 1, 1), -1);
    T = T / (2 * Delta^2);
    
    % Beräkning av egenvärden för fmax
    V_max = diag(0.5 * fmax^2 * x.^2);
    H_max = T + V_max;
    [~, E_max] = eig(H_max);
    E_max = diag(E_max);
    
    % Energidifferens för lambda_target_1
    deltaE_1 = E_max(2) - E_max(1); % För lambda_target_1
    lambda_num_1 = hbar * c / deltaE_1; % Beräknad våglängd för fmax
    
    % Beräkning av egenvärden för fmin
    V_min = diag(0.5 * fmin^2 * x.^2);
    H_min = T + V_min;
    [~, E_min] = eig(H_min);
    E_min = diag(E_min);
    
    % Energidifferens för lambda_target_2
    deltaE_2 = E_min(2) - E_min(1); % För lambda_target_2
    lambda_num_2 = hbar * c / deltaE_2; % Beräknad våglängd för fmin
    
    % Beräkning av egenvärden för fmid
    fmid = (fmax + fmin) / 2; % Medelvärde mellan fmax och fmin
    V_mid = diag(0.5 * fmid^2 * x.^2);
    H_mid = T + V_mid;
    [~, E_mid] = eig(H_mid);
    E_mid = diag(E_mid);
    
    % Energidifferens för lambda_target_3
    deltaE_3 = E_mid(2) - E_mid(1); % För lambda_target_3
    lambda_num_3 = hbar * c / deltaE_3; % Beräknad våglängd för fmid
    
    % Fel mellan numeriska och givna våglängder
    error_1 = (lambda_num_1 - lambda_target_1)^2; % För lambda_target_1
    error_2 = (lambda_num_2 - lambda_target_2)^2; % För lambda_target_2
    error_3 = (lambda_num_3 - lambda_target_3)^2; % För lambda_target_3
    
    % Total fel
    error = error_1 + error_2 + error_3;

    % Debug-utskrifter för att spåra värden
    fprintf('a = %.3e, fmax = %.3f, fmin = %.3f, error = %.3e\n', a, fmax, fmin, error);
end

