function rhp_count = rhp_count(K)
    %RHP_COUNT Summary of this function goes here
    %   Detailed explanation goes here
    rhp_count = 0;
    zeroes = roots([1 25 15 20 K])'; 
    for root = zeroes
        if real(root) > 0.0
            rhp_count = rhp_count + 1;
        end
    end
end

