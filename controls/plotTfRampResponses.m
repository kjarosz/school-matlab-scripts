function plotTfRampResponses(tf0,tf_comp)
%PLOTTFRESPONSES Summary of this function goes here
%   Detailed explanation goes here
    t=0:0.001:150;
    s = tf('s');
    [y] = step(tf0/s,t);
    [y_comp] = step(tf_comp/s, t);
    plot(t,y);
    hold on;
    plot(t,y_comp);
    plot(t,t);
    hold off;
    grid on;    
    legend("Uncompensated", "Compensated", "Ramp");
end

