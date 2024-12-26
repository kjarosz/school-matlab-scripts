%% Parameters
fs = 50e3;
Vo = 240;
Po = 100;
Vi = 48;
D = 0.5;

fprintf("Given parameters:\n");
printvar("Vi", Vi);
printvar("Vo", Vo);
printvar("Po", Po);
printvar("fs", fs);
printvar("D", D);

Lss = 19.2e-3; % Secondary coil inductance, 19.2 mH
C = 100e-9; % Ripple filter cap, 100 nF

printvar("Lss", Lss);
printvar("C", C);

B_avg = 1; % Tesla
B_delta = 0.25 * B_avg; 

printvar("B_avg", B_avg);
printvar("B_delta", B_delta);

fprintf("\n");

%% QS1.3.f
m = (1 - D)/D * Vo / Vi;

fprintf("m = Ns/Np = (1 - D) / D * (Vo / Vi) \n");
fprintf("          = (1 - %.2f) / %.2f * (%.2f / %.2f)", ...
    D, D, Vo, Vi);
fprintf("          = %.2f\n\n", m)

%% QS1.4.g
Io = Po / Vo;
fprintf("Io = Po / Vo = %.2f / %.2f = %.2f\n", Po, Vo, Io);

Im = m / (1 - D) * Io;
fprintf("Im = m / (1 - D) * Io = %.2f / (1 - %.2f) * %.2f = %.2f\n\n", ...
    m, D, Io, Im);

%% QS1.4.m
R = Vo^2 / Po;
fprintf("tR = Vo^2 / Po = %.2f^2 / %.2f = %.2f\n", Vo, Po, R);

Ts = 1 / fs;
fprintf("Ts = 1 / fs = 1 / %.2f = %f\n", fs, Ts);

Lm = B_delta / B_avg * (1 / m)^2 * R * (1 - D)^2 * Ts;
fprintf("Lm = B_delta / B_avg * (1/m)^2 * R * (1-D)^2 * Ts\n");
fprintf("   = %.2f / %.2f * (1/%.2f)^2 * %.2f * (1-%.2f)^2 * %.2f\n", ...
    B_delta, B_avg, m, R, D, Ts);
fprintf("   = %f\n\n", Lm);