q = 1.6e-19;
k = 1.38e-23;
T = 25 + 273.15;

pv_battery_charger = struct( ...
    "V_bpf", 0.7, ...
    "V_batt", 24, ...
    "R_batt", 0.02, ...
    "I_sc", 5.2, ...
    "R_p", 20, ...
    "R_s", 0.002, ...
    "temp_coeff", q/k/T ...
    );


function F = equations(x)
    n = 60;
    s = 20;
    V_bpf = 0.7;
    V_batt = 24;
    R_batt = 0.02;
    I_sc = 5.2;
    R_p = 20;
    R_s = 0.002;
    I_s = 2.4e-9;
    q = 1.6e-19;
    k = 1.38e-23;
    T = 25 + 273.15;
    i_pv = x(1);
    v_pv = x(2);

    F(1) = I_sc - I_s*(exp(38.9*(i_pv*R_s + v_pv)) - 1) - i_pv*(R_s/R_p + 1) - v_pv/R_p;
    F(2) = s*V_bpf + i_pv*R_batt + V_batt - (n-s)*v_pv;
end

function e = calc_error(x)
    i_pv
end


%{
    fun = @equations;
    x0 = [10, 1];
    options = optimoptions('fsolve','Display','iter');
    options = optimoptions(options, 'MaxFunctionEvaluations', 10000000);
    options = optimoptions(options, 'MaxIterations', 100000);
    fsolve(fun, x0, options)
}%