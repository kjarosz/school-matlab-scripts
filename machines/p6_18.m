V_LL = 208;
P_rated = 20e3;
poles = 4;
X_s = 1.5; % per phase
PF = 0.8; % lagging

% Part A
P_out = 10e3
S = P_out / PF

V_t = V_LL / sqrt(3)
I_a_mag = S / sqrt(3) / V_LL
theta = -acos(PF) % lagging PF
theta_deg = theta * 180 / pi
I_a = I_a_mag * (cos(theta) + i * sin(theta))

V_a = I_a * (i * X_s)
V_a_mag = abs(V_a)
V_a_angle = angle(V_a)*180/pi

E_f = V_t + V_a
E_f_mag = abs(E_f)
E_f_angle = angle(E_f)*180/pi

% Part B
PF = 1
P_out = 10e3
S = P_out / PF

V_t = V_LL / sqrt(3)
I_a_mag = S / sqrt(3) / V_LL
theta = -acos(PF) % lagging PF
theta_deg = theta * 180 / pi
I_a = I_a_mag * (cos(theta) + i * sin(theta))

V_a = I_a * (i * X_s)
V_a_mag = abs(V_a)
V_a_angle = angle(V_a)*180/pi

E_f2 = V_t + V_a
E_f2_mag = abs(E_f2)
E_f2_angle = angle(E_f2)*180/pi

perc = E_f2_mag/E_f_mag*100