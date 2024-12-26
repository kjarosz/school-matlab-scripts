% part c
V_LL = 15e3; % V
P_out = 100e6; % target power
V_phase = V_LL/sqrt(3)
PF = 0.8;
X_s = 1.2372;

I_mag_a = P_out/sqrt(3)/V_LL

theta = acos(0.8)
theta_deg = theta*180/pi

I_a = I_mag_a*(cos(theta) + i*sin(theta))

V_a = I_a * (i * X_s)
V_a_mag = abs(V_a)
V_a_angle = angle(V_a)*180/pi

E_f = V_phase + I_a*(i*X_s)
E_f_mag = abs(E_f)
E_f_angle = angle(E_f)*180/pi

I_f = E_f_mag/V_phase*750