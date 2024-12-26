Vo = 48;
Po = 120;
Ton = 20e-6;


% 2
D1 = Vo / 96

% 3
D2 = Vo / 72

% 4
T_on = 20e-6
f_s1 = D1/T_on
f_s2 = D2/T_on

f_smin = min(f_s1, f_s2)

D_op = D1

L_min = Vo^2/2/Po*(1-D_op)/f_s1

delta_I_L = Vo/L_min*(1 - D_op)/f_s1

Ts = 1/f_s1

delta_V_o = 2.4;

C_min = Vo*Ts^2/8/L_min/delta_V_o*(1 - D_op)