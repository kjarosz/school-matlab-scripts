function display_Z(prefix, Z)
%DISPLAY_Z Summary of this function goes here
%   Detailed explanation goes here
fprintf("%s_mag = %.4f\n", prefix, abs(Z))
fprintf("%s_angle_rad = %.4f\n", prefix, angle(Z))
fprintf("%s_angle_deg = %.4f\n", prefix, angle(Z)*180/pi)
end

