R1 = 2.2;
X1 = 2.5;
R2p = 3.5;
X2p = 2.5;
Xmag = 60;

f = 60;
poles = 4;

V_rated = 115;
P_rated = hp_to_watts(0.25) % watts
P_core = 20;
P_fric_windage = 15;
n_rated = 1725; % rpm

s = 0.04;

ns = 120*f/poles
n = ns*(1-s)

eq_circ = single_phase_simplified_equivalent_circuit(...
    s, ...
    single_phase_equivalent_circuit(...
        R1, X1, R2p, X2p, Xmag, 0))

Z_total = eq_circ.Z1 + eq_circ.Zf + eq_circ.Zb
display_Z("Z", Z_total)

Iin = V_rated/Z_total
display_Z("Iin", Iin)

PF = cos(angle(Iin))

P_in = V_rated*abs(Iin)*PF

T_d = single_phase_torque(eq_circ, abs(Iin), ns)

P_copper_losses = single_phase_copper_loss( ...
    eq_circ, ...
    abs(Iin), ...
    s)