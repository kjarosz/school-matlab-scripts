function Z = xformer_scparams(voltage, current, power)
R = power/current^2;
Z_eq = voltage/current;
X = sqrt(Z_eq^2 - R^2);
Z = R + 1i*X;
end