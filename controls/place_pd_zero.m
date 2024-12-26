function zero = place_pd_zero(K, G, H, zeta, sigma_d)
% Calculates location of zero for a target pole placement at -sigma_d on damping ratio line zeta
%   K = proportional gain
%   sigma_d = absolute value of the real part of the target transfer function pole
%   zeta = damping ratio
    omega_d = sqrt((sigma_d/zeta)^2 - sigma_d^2)
    theta = -testAngle(K*G*H, -sigma_d+omega_d*i)-pi
    zero = -omega_d/tan(theta)-sigma_d
end