function omega_bw = bodeBandwidthFrequency(zeta, omega_n)
%BODEBANDWIDTHFREQUENCY Summary of this function goes here
%   Detailed explanation goes here
    omega_bw = omega_n*sqrt((1-2*zeta^2)+sqrt(4*zeta^4-4*zeta^2+2));
end

