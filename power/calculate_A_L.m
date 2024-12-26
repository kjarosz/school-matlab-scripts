function A_L = calculate_A_L(u, OD, ID, HT)
    l_e = pi*(OD/2+ID/2);
    A_e = (OD/2-ID/2)*HT;
    A_L = u .* A_e / l_e;
end