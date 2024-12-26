P_rated = hp_to_watts(0.25)
V_rated = 230;
f = 60;
poles = 4;
n_rated = 1710;
P_rot = 30 + 15;

Zm = 9.5 + 1i*12;
Z2p = 10.8 + 1i*12;
Zmag = 1i*260;

eq_circ = single_phase_equivalent_circuit( ...
    9.5, 12, ...
    10.8, 12, ...
    260, ...
    0)

%% slip
n_sync = 120*f/poles
s = (n_sync - n_rated)/n_sync

seq_circ = single_phase_simplified_equivalent_circuit(s, eq_circ)

%% motor current
Z_total = seq_circ.Z1 + seq_circ.Zf + seq_circ.Zb;
I_in = V_rated / Z_total;
display_Z("I_in", I_in);

%% input power factor
PF = cos(angle(I_in))

%% input power
P_in = real(V_rated*I_in)

%% developed torque
T_d = single_phase_torque(seq_circ, abs(I_in), n_sync)

%% output shaft power and torque
omega_m = 2*pi*n_rated/60
P_mech = T_d*omega_m
P_out = P_mech - P_rot

T_out = P_out/omega_m

