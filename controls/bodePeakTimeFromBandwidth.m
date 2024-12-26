function Tp = bodePeakTimeFromBandwidth(zeta, bw)
    Tp = pi/bw/sqrt(1-zeta^2)*sqrt((1-2*zeta^2)+sqrt(4*zeta^4-4*zeta^2+2));
end