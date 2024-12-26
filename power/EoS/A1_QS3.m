Po = 75;
Vo = 48;

% Part 1.3.1.1
I_L = Po/Vo
Io = I_L;

% Part 1.3.1.2
fs = 40000
Ts = 1/fs
L = 470e-6
D = 0.289
delta_I_L_ccm = Vo/L*(1-D)*Ts

% Part 1.3.1.3
half_delta_I_L_ccm = delta_I_L_ccm/2

% Part 1.3.2.1
i_L_max = I_L + half_delta_I_L_ccm
