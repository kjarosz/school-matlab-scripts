L = 1; % particular values are inconsequential here
R = 1; 
Vs = 5; 
tau = L/R; 
t = linspace(0, 6*tau, 100);
i_L = Vs/R*(1 - exp(-t/tau));
v_L = Vs*exp(-t/tau);
plot(t, i_L);
hold on;
plot(t, v_L);

t_perc = [0 tau 3*tau 5*tau];
i_perc = i_L / (Vs/R) * 100.0
v_perc = v_L / (Vs) * 100.0
