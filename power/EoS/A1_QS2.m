Vo = 48;
Po = 75;
D = 0.289;
L = 120e-6;
fs = 40e3;
Ts = 1/fs

% QS 2.1.1
delta_I_L = Vo/L*(1-D)*Ts

% 2.1.2

ccm_I_o = Po/Vo
half_delta_I_L = delta_I_L/2

% 2.2.2
R = Vo^2/Po
Vi = (0.5 + 0.5*sqrt(1 + 8*L/D^2/R/Ts))*Vo

% 2.2.4
Io = Po/Vo

% 2.3.2
i_L_max = (Vi-Vo)/L*D*Ts

% 2.3.4
t_d = (1 - 2*Io/i_L_max)*Ts