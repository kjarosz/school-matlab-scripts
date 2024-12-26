function G_t = tf_ilaplace(G_s)
%TF_ILAPLACE Takes a transfer function and provide laplace inverse in
%t-domain
syms z
G_t = ilaplace(poly2sym(G_s.numerator, z) / poly2sym(G_s.denominator, z));
end

