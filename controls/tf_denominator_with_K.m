function denTf = tf_denominator_with_K(G, H)
    syms x K;
    symG = tf2sym(G);
    symH = tf2sym(H);
    [numG, denG] = numden(symG);
    [numH, denH] = numden(symH);
    denTf = coeffs(simplify(denH*denG + K*numG*denG), x);
end