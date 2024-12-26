function plotDampingRatioVsPhaseMargin()
    z = 0:0.01:3;
    phi = bodePhaseMarginFromDampingRatio(z);
    plot(z,phi);
    grid on
end