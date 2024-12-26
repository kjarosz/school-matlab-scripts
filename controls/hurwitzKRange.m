function pole_counts = hurwitzKRange(hurwitz_table)
% HURWITZKRANGE  Creates a table with various key points of gain K where signs can switch in the first column
%   pole_counts = HURWITZKRANGE(HTABLE) Creates table of K, LHP poles, RHP poles, and poles on axis in each row respectively. 
%
%   Output table
%     row 1 - K ranges. Each column represents K greater than value in the column and less than the next column
%     row 2 - Number of poles in LHP
%     row 3 - Number of poles in RHP
%
%   Example
%       row1 (K):               -inf | -2 | 0 | inf   
%       row2 (# of LHP poles):     4 |  2 | 2 | 2
%       row3 (# of RHP poles):     0 |  2 | 2 | 2
%
%     In column 2, K value is -2 which means that pole counts below it are for -2 < K < 0 (next entry)
%   In this instance, for K > -2, there are 2 poles in LHP and 2 poles in RHP. K < -2 has 4 poles in LHP

    firstColumn = hurwitz_table(:,1)';
    
    % Find all values of K where a value in a column would switch signs
    K_zeros = [];
    for row = firstColumn
        [num, den] = numden(row);
        K_zeros = addKeyKValues(K_zeros, num);
        K_zeros = addKeyKValues(K_zeros, den);
    end
    K_zeros = unique(sort(K_zeros)); % Dedupe and sort in ascending order
    
    pole_counts = initializePoleCountTable(K_zeros);
    % Count LHP and RHP poles
    pole_counts = count_poles(pole_counts, firstColumn, 1, K_zeros(1)-1);
    for i = 2:1:1+length(K_zeros)
        x = pole_counts(1, i);
        next = pole_counts(1, i+1);
        if next == inf 
            % We can't find an average between a constant and Infinity, so just +1 the K value
            next = x + 1; 
        end
        K = (x + next)/2;

        pole_counts = count_poles(pole_counts, firstColumn, i, K);
    end
end

function ret = addKeyKValues(K_zeros, polynomial)
    syms K;
    ret = K_zeros;
    if has(polynomial, K)
        zeroes = solve(polynomial==0, K)';
        for z = zeroes
            ret(end+1) = z;
        end
    end
end

function pole_counts = initializePoleCountTable(K_zeros)
    pole_counts = zeros(3, length(K_zeros)+2);
    pole_counts(1, 1) = -inf;
    pole_counts(1, 2:end-1) = K_zeros;
    pole_counts(1, end) = inf;
end

function ret = count_poles(pole_counts, firstColumn, index, value)
    syms K;
    lhp=0;
    rhp=0;
    prev_sign = sign(subs(firstColumn(1), K, value));
    for column = firstColumn(2:end)
        s = sign(subs(column,K,value));
        if prev_sign == s
            lhp = lhp + 1;
        else
            rhp = rhp + 1;
        end
        prev_sign = s;
    end

    ret = pole_counts;
    ret(2, index) = lhp;
    ret(3, index) = rhp;
end