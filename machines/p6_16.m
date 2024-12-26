clear;

P_rated = 120e6;
V_LL = 12e3;
f_e = 60;
PF = 0.85; % lagging
R_a_pu = 0.015;
X_s_pu = 0.85;

% Part b
phi_rad = -acos(PF);
phi = phi_rad * 180/pi

V_t_base = V_LL/sqrt(3)
I_a_base = P_rated/sqrt(3)/V_LL
Z_s_base = V_t_base/I_a_base

R_a = Z_s_base*R_a_pu
X_s = Z_s_base*X_s_pu

% Part C
Z_s = R_a + i*X_s
Z_s_mag = abs(Z_s)
Z_s_angle = angle(Z_s)*180/pi

I_a = I_a_base * (cos(phi_rad) + i*sin(phi_rad))
I_a_mag_pu = abs(I_a)/I_a_base
I_a_angle = angle(I_a)*180/pi

V_a = I_a * Z_s
V_a_mag = abs(V_a)
V_a_mag_pu = V_a_mag/V_t_base
V_a_angle = angle(V_a)*180/pi

E_f = V_t_base + I_a*Z_s
E_f_mag = abs(E_f)
E_f_angle = angle(E_f)*180/pi

% Part D
Efficiency = 0.92
% Part i
P_a = 3 * I_a_base^2 * R_a

% Part ii
P_out = P_rated * PF
P_in = P_out / Efficiency
P_rotational = P_in - P_out - P_a

% Part iii
T = P_in / ((3600 * 2*pi) / 60)