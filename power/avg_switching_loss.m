function loss = avg_switching_loss(Vin, Io, tcOn, tcOff, fs)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
loss = 0.5 * Vin * Io * (tcOn + tcOff) * fs;
end