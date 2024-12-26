function params = single_phase_blocked_params(blocked)

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
end

