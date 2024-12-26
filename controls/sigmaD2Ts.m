function T_s = sigmaD2Ts(damping_ratio,sigma_d)
%SETTLING_TIME Summary of this function goes here
%   Detailed explanation goes here
    T_s = -log(0.02*sqrt(1-damping_ratio^2))/sigma_d;
end

