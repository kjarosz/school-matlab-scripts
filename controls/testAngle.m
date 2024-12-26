function theta = testAngle(transfer_function, test_point)
%TESTANGLE Summary of this function goes here
%   Detailed explanation goes here
    zeroSum = sum(angle(test_point - roots(transfer_function.numerator{1})));
    poleSum = sum(angle(test_point - roots(transfer_function.denominator{1})));
    theta = (zeroSum - poleSum);
end

