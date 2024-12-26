function parameters = single_phase_blocked_noload_params(R_winding, blocked, noload)
%SINGLE_PHASE_DOUBLE_FIELD_CIRCUIT Summary of this function goes here
%   Detailed explanation goes here

%% Blocked/standstill
%s_blocked = 1;

% From
% blocked.power = I_blocked^2 * (R_winding + R_2prime)
R_2prime = blocked.power/blocked.current^2 - R_winding
Z_blocked_mag = blocked.voltage/blocked.current
X_total = sqrt(Z_blocked_mag^2 - (R_winding + R_2prime)^2)

% X_total = X_1 + X_2prime
% assuming X_1 = X_2prime
X1 = X_total/2
X_2prime = X_total/2

%% No-load/freespin
Z_noload_mag = noload.voltage/noload.current
R_noload = noload.power/noload.current^2

% Z_noload^2 = R_noload^2 + (X_noload)^2
% X_noload = 0.5*X_mag + X_1 + 0.5*X_2prime
% so
X_mag = 2*(sqrt(Z_noload_mag^2 - R_noload^2) - X1 - 0.5*X_2prime)

%% Rotational loss
% P = I^2(R1 + 0.5R_2prime) + P_rot
P_rot = noload.power - noload.current^2 * (R_winding + 0.5*R_2prime)
R_rot = P_rot/noload.current^2

parameters = single_phase_equivalent_circuit(...
    "R1", R_winding, ...
    "X1", X1, ...
    "R2prime", R_2prime, ...
    "X2prime", X_2prime, ...
    "Xmag", X_mag, ...
    "R_rot", R_rot);


end

