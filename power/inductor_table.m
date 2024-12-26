L = 1; R = 1; Vs = 1; % particular values are inconsequential here
tau = L/R; 
t = linspace(0, 6*tau, 100);
i_L = Vs/R*(1 - exp(-t/tau));
v_L = Vs*exp(-t/tau);
plot(t, i_L);
title("Inductor current")
ylabel("Current (A)");
xlabel("Time (t)");
grid;
figure;
plot(t, v_L);
title("Inductor voltage")
ylabel("Voltage (V)");
xlabel("Time (t)");
grid;

t_perc = [0 tau 3*tau 5*tau];
i_perc = Vs/R*(1 - exp(-t_perc/tau)) / (Vs/R) * 100.0
v_perc = Vs*exp(-t_perc/tau) / (Vs) * 100.0
