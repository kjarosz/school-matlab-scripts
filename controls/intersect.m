function intersect(tf,zeta)
%INTERSECT Finds poles that intersect a damping ratio line
%   Detailed explanation goes here
    sigma_d = 0:-0.001:-10;
    omega_d = -sigma_d/zeta;
    zeroes = roots(tf.numerator{1});
    poles = roots(tf.denominator{1});
    locations = sigma_d + 1i*omega_d;
    points = arrayfun(@(location) sum(angle(location - zeroes)), locations) ...
        - arrayfun(@(location) sum(angle(location - poles)), locations) ...
        + pi;
    gains = arrayfun(@(location) prod(abs(location-poles)), locations) ...
        ./ arrayfun(@(location) prod(abs(location-zeroes)), locations);
    plot(sigma_d, points);
    title("Zero/Pole Angles Sum");
    grid on;
    figure;
    plot(sigma_d, gains);
    title("Gain");
    grid on;
end

