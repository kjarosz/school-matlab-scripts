% This is a script to plot the function y=sin(alpha*t).
%
% The value of alpha must exist in the workspace prior
% to invoking the script.
%
t=[0:0.01:1];
y=sin(alpha*t);
plot(t,y)
xlabel('Time (sec)')
ylabel('y(t) = sin(\alpha t)')
grid on