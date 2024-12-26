function phase_margin = bodePhaseMarginFromDampingRatio(zeta)
    phase_margin = 180/pi*atan(2*zeta./sqrt(-2*zeta.^2+sqrt(1+4*zeta.^4)));
end