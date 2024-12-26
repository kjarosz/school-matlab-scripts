function target_pole = targetSigmaDByTpAdjustment(zeta, sigma_d, T_p_adjuster)
%TARGETPOLEBYTSADJUSTMENT Given a pole and damping ratio, find new pole based on an adjustment to the Peak Time
%   Detailed explanation goes here
%   OL = Open Loop transfer function G(s)H(s)
%   zeta = damping ratio
%   sigma_d = real part of the original pole
%   T_p_adjuster = lambda function with original peak time as input, and target peak time as output
    wn = abs(sigma_d)/zeta;
    wd = wn*sqrt(1-zeta^2);
    T_p = pi/wd;
    adjusted_Tp = T_p_adjuster(T_p);
    target_wd = pi/adjusted_Tp;
    target_wn = target_wd/sqrt(1-zeta^2);
    target_sigma_d = -zeta*target_wn;
    target_pole = target_sigma_d + target_wd*i;
end

