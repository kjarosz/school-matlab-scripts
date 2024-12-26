function E_f = calculate_Ef(PF)
if PF > 0 
    theta = acos(PF)
else 
    theta = -acos(abs(PF))
end
theta_deg = theta*180/pi
I_a = 15e6/sqrt(3)/12e3*(cos(theta)+i*sin(theta))
I_a_mag = abs(I_a)
I_a_thet = angle(I_a)*180/pi

Z_s = 0.35 + i*7
Z_s_mag = abs(Z_s)
Z_s_angle = angle(Z_s)*180/pi

E_a = I_a*Z_s
E_a_mag = abs(E_a)
E_a_angle = angle(E_a)*180/pi

V_phase = 12e3/sqrt(3)
E_f = V_phase + I_a*(0.35 + i*7)
E_f_mag = abs(E_f)
E_f_angle = angle(E_f)*180/pi
end