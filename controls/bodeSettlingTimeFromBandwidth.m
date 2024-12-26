function Ts = bodeSettlingTimeFromBandwidth(zeta, omega_bw)
    Ts = 4/omega_bw/zeta*sqrt((1-2*zeta^2)+sqrt(4*zeta^4-4*zeta^2+2));
end