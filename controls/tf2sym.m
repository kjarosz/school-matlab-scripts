function ans = tf2sym(T)
%SYM2TF Summary of this function goes here
%   Detailed explanation goes here
    ans = poly2sym(T.numerator{1})/poly2sym(T.denominator{1});
end

