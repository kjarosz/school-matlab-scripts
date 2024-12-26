V_in = 110
f = 60
poles = 6
P_rated = hp_to_watts(1/3)

P_core_loss = 35
P_fric = 16

slip = 0.05

eq_circ = single_phase_equivalent_circuit(1.52, 2.1, 3.13, 1.56, 58.2, 0)
seq_circ = single_phase_simplified_equivalent_circuit(0.05, eq_circ)

ns = 120*f/poles
nm = ns*(1-slip)

Zin = seq_circ.Z1 + seq_circ.Zf + seq_circ.Zb
display_Z("Zin", Zin)

Iin = V_in / Zin
display_Z("Iin", Iin)

PF = cos(angle(Iin))

Pin = V_in * abs(Iin) * PF

Rf = real(seq_circ.Zf)
Rb = real(seq_circ.Zb)
Pg = abs(Iin)^2 * (Rf + Rb)
omega_sync = 2*pi*ns/60
omega_motor = 2*pi*nm/60

T_d = abs(Iin)^2 / omega_sync * (Rf + Rb)
P_mech = T_d * omega_motor


P_out = P_mech - P_core_loss - P_fric

T_load = P_out/omega_motor

eff = P_out / Pin