% Plots function y=(4/pi).*cos(omega*x)+(4/(9*pi))*cos(3*omega*x)
% on interval 0 <= x <= 10
%
% variable omega must be defined before executing
%
x=[0:0.1:10]';
y=(4/pi).*cos(omega*x)+(4/(9*pi))*cos(3*omega*x);
plot(x,y)
xlabel("Time (sec)");
ylabel("y(x)=(4/\pi)*cos(\omega x)+(4/9\pi)*cos(3\omega x)")