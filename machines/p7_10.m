V_rated = 120;
f = 60;
poles = 4;

Z_m = 5.5 + 1i*4.8;
Z_a = 8.5 + 1i*5.0;

%% Calculate cap for 90 degree phase difference

X_c = atan(angle(Z_m)+90*pi/180)*real(Z_a) + imag(Z_a)
C = 1/(2*pi*60*X_c)

%% Starting torque
I_m = V_rated / Z_m;
I_a_nocap = V_rated / Z_a;
display_Z("I_a_nocap", I_a_nocap);

ns = 120*f/poles
omega_sync = 2*pi*ns/60
T_st_nocap = real(Z_m)*2*abs(I_a_nocap)*abs(I_m)*sin(angle(I_a_nocap)-angle(I_m))/omega_sync