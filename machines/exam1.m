eq_circ = single_phase_equivalent_circuit(2, 2.56, 2.8, 2.56, 60.5, 0)
seq_circ = single_phase_simplified_equivalent_circuit(0.05, eq_circ)

Z_total = seq_circ.Z1 + seq_circ.Zf + seq_circ.Zb
display_Z("Z_total", Z_total);

V_ph = 120;
I_in = V_ph/Z_total
display_Z("I_in", I_in);
P_in = V_ph*abs(I_in)*cos(angle(I_in))

%% gap power
Pg = abs(I_in)^2 * (real(seq_circ.Zf) + real(seq_circ.Zb))

%% Pconv
n_sync = 120*60/4
omega_sync = n_sync * 2 * pi / 60
omega_motor = (n_sync*2*pi/60)*(1-0.05)
T_d = abs(I_in)^2 / omega_sync * (real(seq_circ.Zf) - real(seq_circ.Zb))
P_mech = T_d*omega_sync

P_out = P_mech - 51

%%
T_load = P_out/omega_motor

eff = P_out/P_in