I_sm = 15; % Made up number
omega = 2*pi*60; % Typical 60 Hz house circuit
omega_m = 5; % lol
delta = 0; % no offset
L2 = 5; % 5 Henry's, why not


period = 2 * pi / omega;
t = linspace(0, 2*period, 2*360);

y1 = - I_sm^2 * L2 * (sin(omega*t).^2) .* sin(2*(omega_m*t+delta));
y2 = -0.5 * I_sm^2 * L2 * (sin(2*(omega_m*t + delta)) - 0.5*sin(2*((omega_m+omega)*t + delta)) - 0.5*sin(2*((omega_m - omega)*t + delta)));

plot(t, y1);
hold on;
plot(t, y2);
hold off;
legend;