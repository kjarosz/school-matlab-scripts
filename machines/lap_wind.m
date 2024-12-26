function lap_wind(Yb,Yf, Z, x)
%LAP_WIND Summary of this function goes here
%   Detailed explanation goes here

%% Back connection
next = x + Yb;
if next > Z
    fprintf("Yb: %d + %d = %d - %d = %d\t", ...
        x, Yb, ...
        next, Z, ...
        next - Z);
    next = next - Z;
else
    fprintf("Yb: %d + %d = %d\t\t\t\t", x, Yb, next);
end

if next == 1
    fprintf("\n")
    return
end

x = next;

%% Front connection
next = x - Yf;
if next < 1
    fprintf("Yf: %d - %d = %d + %d = %d\n", ...
        x, Yf, ...
        next, Z, ...
        next + Z);
    next = next + Z;
else
    fprintf("Yf: %d - %d = %d\n", x, Yf, next);
end

if next == 1
    fprintf("\n");
    return
end

%% Recurse
lap_wind(Yb, Yf, Z, next);

end