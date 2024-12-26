function losses = single_phase_copper_loss( ...
    simplified_equivalent_circuit, ...
    current, ...
    slip)

Pgf = current^2 * real(simplified_equivalent_circuit.Zf);
fprintf("P_gf = I_1^2*R_f")
fprintf(" = (%.2f)^2 * (%.2f)", ...
    current, ...
    real(simplified_equivalent_circuit.Zf))
fprintf(" = %.2f\n", Pgf)

Pgb = current^2 * real(simplified_equivalent_circuit.Zb);
fprintf("P_gb = I_1^2*R_b")
fprintf(" = (%.2f)^2 * (%.2f)", ...
    current, ...
    real(simplified_equivalent_circuit.Zb))
fprintf(" = %.2f\n", Pgb)

Pcu = slip*Pgf + (2 - slip)*Pgb;
fprintf("P_cu = s*P_gf + (2 - s)*P_gb");
fprintf(" = %.4f*%.2f + (2 - %.4f)*%.2f", ...
    slip, ...
    Pgf, ...
    slip, ...
    Pgb);
fprintf(" = %.2f\n", Pcu)

losses = struct( ...
    "Pgf", Pgf, ...
    "Pgb", Pgb, ...
    "Pcu", Pcu);

end

