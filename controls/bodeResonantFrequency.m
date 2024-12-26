function omega_p = bodeResonantFrequency(zeta,natural_frequency)
%BODEPEAKFREQUENCY Summary of this function goes here
%   Detailed explanation goes here
    omega_p = natural_frequency*sqrt(1-2*zeta^2);
end

