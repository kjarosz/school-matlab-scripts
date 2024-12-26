function zeta = os2zeta(perc_os)
%OS2ZETA Summary of this function goes here
%   Detailed explanation goes here
zeta = -log(perc_os/100)/sqrt(pi^2+log(perc_os/100)^2);
end

