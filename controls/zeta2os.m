function perc_os = zeta2os(zeta)
%OS2ZETA Summary of this function goes here
%   Detailed explanation goes here
perc_os = 100*exp(-zeta*pi/sqrt(1-zeta*zeta));
end

