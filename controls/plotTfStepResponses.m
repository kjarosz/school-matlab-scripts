function plotTfStepResponses(tf0,tf_comp)
%PLOTTFRESPONSES Summary of this function goes here
%   Detailed explanation goes here
    [y,t] = step(tf0);
    [y_comp] = step(tf_comp, t);
    plot(t,y);
    hold on;
    plot(t,y_comp);
    hold off;
    grid on;    
    yline(y(end), '-');
    yline(y_comp(end), '-');
    yline(1, '-.');
    yline(1.02, ':');
    yline(0.98, ':');
    legend("Uncompensated", "Compensated", "Uncompensated FV", "Compensated FV", "Ideal FV", "Upper settling bound", "Lower settling bound");
end

