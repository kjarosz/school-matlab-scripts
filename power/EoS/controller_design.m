R = 19.2;
C = 220e-6;
r = 1e-6;
L = 200e-6;

phi_margin = 60;


Vin = 84; % Average
kfb = 1/Vin;

G_ps = Vin/L/C * tf([r*C 1], [1 (1/R/C + r/L) 1/L/C])
G_pwm = 1

%close
plot_opts = bodeoptions;
plot_opts.FreqUnits = 'Hz';
%bodeplot(G_ps, plot_opts)
%grid on

f_c = 1e3;

G_ps_phi_fc = -175
phi_boost = -90 + phi_margin - G_ps_phi_fc

f_res = 1/2/pi/sqrt(L*C)

G_ps_k_fc = 10^(40.9/20)
G_c_k_fc = 1/(G_ps_k_fc/84)

K_boost = tan(45 + phi_boost/4)

fp = K_boost * f_c
fz = f_c / K_boost

wp = 2*pi*fp
wz = 2*pi*fz

k_c = G_c_k_fc * wz / K_boost

G_c = zpk([-wz -wz], [0 -wp -wp], k_c)

format short g
tf(G_c)

format shortEng
G_L = G_c * G_pwm * G_ps * kfb

bodeplot(G_L, plot_opts)
grid on