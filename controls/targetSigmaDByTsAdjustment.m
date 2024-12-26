function target_sigma_d = targetSigmaDByTsAdjustment(zeta, sigma_d, T_s_adjuster)
%TARGETPOLEBYTSADJUSTMENT Given a pole and damping ratio, find new pole based on an adjustment to the Settling Time
%   Detailed explanation goes here
%   OL = Open Loop transfer function G(s)H(s)
%   zeta = damping ratio
%   sigma_d = real part of the original pole
%   T_s_adjuster = lambda function with original settling time as input, and target settling time as output
    T_s = sigmaD2Ts(zeta,sigma_d)
    adjusted_Ts = T_s_adjuster(T_s)
    target_sigma_d = Ts2SigmaD(zeta,adjusted_Ts)
end

