C = 1; R = 1; Vs = 1; % particular values are inconsequential here
tau = C*R; 
t = linspace(0, 6*tau, 100);
v_C = Vs*(1 - exp(-t/tau));
i_C = Vs/R*exp(-t/tau);
plot(t, v_C);
title("Capacitor voltage")
ylabel("Voltage (V)");
xlabel("Time (t)");
grid;
figure;
plot(t, i_C);
title("Capacitor current")
ylabel("Current (A)");
xlabel("Time (t)");
grid;

t_perc = [0 tau 3*tau 5*tau];
i_perc = Vs*(1 - exp(-t_perc/tau)) / (Vs/R) * 100.0
v_perc = Vs/R*exp(-t_perc/tau) / (Vs) * 100.0
