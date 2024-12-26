function [Im, Zm] = phase_current(V,Im_mag, Pm_mag)
%PHASE_CURRENT Summary of this function goes here
%   Detailed explanation goes here

Rm = Pm_mag/Im_mag/Im_mag;
Zm_mag = 25/4.5;
Xm = sqrt(Zm_mag^2-Rm^2);
Zm = Rm + i*Xm;

Im = V/Zm;

end

