function result = poly_mul(coeff1,coeff2)
    %CONV_INT Summary of this function goes here
    %   Detailed explanation goes here
    syms x;
    f1=poly2sym(coeff1);
    f2=poly2sym(coeff2);
    result=fliplr(coeffs(f1*f2, x));
end

