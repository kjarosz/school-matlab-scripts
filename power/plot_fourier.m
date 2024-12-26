function a = a_0(omega)
a = 1;
end

function a = a_n(n, omega)
a = 2./(n.^2)./(omega^2) - 2./(n.^2)./(omega^2).*cos(-2.*n.*omega);
end2

function b = b_n(n, omega)
b = 2./n./omega + sin(-2.*n.*omega).*2./(n.^2)./(omega^2);
end

n_array = 1:10000;
omega = pi;

an = a_n(n_array, omega);
bn = b_n(n_array, omega);

%plot(omega.*n_array, an);
%hold on;
%plot(omega.*n_array, bn);

t = linspace(-2, 4, 100);
w = zeros(1, length(t));
w = w + a_0(omega).*cos(0);
for n = 1:length(n_array)
    w = w + an(n)*cos(n_array(n)*omega*t) + bn(n)*sin(n_array(n)*omega*t);
end

hold off;

plot(t, w);