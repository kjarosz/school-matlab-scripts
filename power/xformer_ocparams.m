function Z = xformer_ocparams(voltage, current, power)
I_R = power/voltage;
R = voltage/I_R;
I_X = sqrt(current^2 - I_R^2);
X = voltage/I_X;
Z = R + 1i*X;
end