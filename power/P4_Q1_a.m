disp("specs")
R_thJC = 0.6
R_thCS = 0.8
R_thSA = 0.8
Z_th = R_thJC + R_thCS + R_thSA
T_Jmax = 187; % Celsius
T_A = 25; % Celsius

E_on = 312e-6
E_off = 120e-6

I_D = 32
R_DSon = 0.048

% Question 1
disp("1.a")
P_loss_max = (187 + 25)/Z_th

disp("1.b")
f = 100e3
P_loss_100khz = f*(E_on + E_off) + 0.5*R_DSon*I_D^2

disp("1.c")
T_J_100khz = P_loss_100khz*Z_th + 25

disp("1.d")
if T_J_100khz < T_Jmax*(1-0.1) 
    disp("Safe")
    margin = 1 - T_J_100khz/T_Jmax
else
    disp("Not safe")
    C_range = (1 - T_J_100khz/T_Jmax)*100
end

disp("1.e")
T_J_safe_margin = T_Jmax*(1-0.1);
P_loss_max_safe_margin = (T_J_safe_margin - T_A)/Z_th

disp("1.f")
f = (P_loss_max_safe_margin - 0.5*R_DSon*I_D^2)/(E_on + E_off)