function impedance = parallel_impedance(impedances)
%PARALLEL_IMPEDANCE Summary of this function goes here
%   Detailed explanation goes here
impedance = 1/sum(1./impedances);
end

