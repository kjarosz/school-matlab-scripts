function T = single_phase_torque(...
    simplified_equivalent_circuit, ...
    current, ...
    rpm_sync_speed)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

Rf = real(simplified_equivalent_circuit.Zf);
Rb = real(simplified_equivalent_circuit.Zb);

omega_sync = rpm_sync_speed * 2*pi / 60;

fprintf("omega_sync = 2*pi*N_s/60 = 2*pi*%d/60 = %.2f\n", ...
    rpm_sync_speed, ...
    omega_sync);

T = current^2 / omega_sync * (Rf - Rb);

end

