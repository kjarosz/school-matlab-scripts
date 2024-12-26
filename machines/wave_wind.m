function wave_wind(Yb,Yf, Z, x)

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
next = x + Yf;
if next > Z
    fprintf("Yf: %d + %d = %d - %d = %d\n", ...
        x, Yf, ...
        next, Z, ...
        next - Z);
    next = next - Z;
else
    fprintf("Yf: %d + %d = %d\n", x, Yf, next);
end

if next == 1
    fprintf("\n");
    return
end

%% Recurse
wave_wind(Yb, Yf, Z, next);

end

