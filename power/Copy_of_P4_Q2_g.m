
function F = equations(x)
    n = 40;
    s = 4;
    V_bpf = 0.6;
    V_batt = 12;
    R_batt = 0.04;
    I_sc = 4;
    R_p = 10;
    R_s = 0.002;
    I_s = 0.5e-9;
    q = 1.6e-19;
    k = 1.38e-23;
    T = 25 + 273.15;
    i_pv = x(1);
    v_pv = x(2);

    V_d = i_pv*R_s +v_pv;
    F(1) = I_sc - I_s*(exp(q/k/T*V_d) - 1) - V_d/R_p;
    F(2) = s*V_bpf + i_pv*R_batt + V_batt - (n-s)*v_pv;
end

fun = @equations;
x0 = [0,0];
options = optimoptions('fsolve','Display','iter-detailed');
options = optimoptions(options, 'MaxFunctionEvaluations', 10000000);
options = optimoptions(options, 'MaxIterations', 100000);
%options = optimoptions(options, 'FiniteDifferenceStepSize', 0.01);
%options = optimoptions(options, 'DiffMaxChange', 0.01);

options = optimoptions(options, 'OptimalityTolerance', 0.00001);
x=fsolve(fun, x0, options)

