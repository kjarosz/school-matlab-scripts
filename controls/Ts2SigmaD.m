function sigma_d = Ts2SigmaD(damping_ratio,Ts)
%TS2SIGMAD Summary of this function goes here
%   Detailed explanation goes here
    sigma_d = -log(0.02*sqrt(1-damping_ratio^2))/Ts;
end

