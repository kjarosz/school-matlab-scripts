P_rated = 250 * 746 % HP -> kW
V_line = 2300;
delta = 15;
X_s = 11 ; % Ohms per phase
P_in = 165.8e3 ; % kW

V_t = V_line/sqrt(3)

E_f_mag = X_s * P_in / 3 / V_t / sin(delta * pi / 180)
E_f_ang = -delta

E_f = E_f_mag * (cos (E_f_ang * pi / 180) + i*sin(E_f_ang * pi / 180))


I_a = (V_t - E_f)/(i*X_s)
I_a_mag = abs(I_a)
I_a_ang = angle(I_a)*180/pi

PF = cos(angle(I_a))


E_f_noload = E_f_mag
I_a_noload = (V_t - E_f_noload)/(i*11)

I_f_target = V_t/E_f_noload
I_f_perc_reduction = (1 - I_f_target)*100