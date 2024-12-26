function Mp = bodeResonantGain(zeta)
%BODEMAGNITUDEPEAK Find value of the peak of a frequency response graph
%   Detailed explanation goes here
    Mp = 1/2/zeta/sqrt(1-zeta^2);
end

