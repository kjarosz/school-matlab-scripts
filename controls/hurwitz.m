function hurwitz_table = hurwitz(polynomial)
    rows = length(polynomial);    
    columns = ceil(rows/2);
    hurwitz_table = initialize_table_from_polynomial(polynomial, rows, columns);
    for row = 3:1:rows
        % [ a b .. .. ]  // r - 2
        % [ c d .. .. ]  // r - 1
        % [ (ad-ab)/c .. .. .. ] // New row in table
        a = hurwitz_table(row-2, 1);
        c = hurwitz_table(row-1, 1);
        if c == 0
            syms x;
            c = x;  
            hurwitz_table(row-1, 1) = x;
        end
        for col = 1:columns
            b = hurwitz_table(row-2, col+1);
            d = hurwitz_table(row-1, col+1);
            hurwitz_table(row,col) = simplify(- det([a b; c d])/c);
        end
        if has_row_of_zeros(hurwitz_table, row)
            hurwitz_table = swap_with_derivative(hurwitz_table, row, rows);
        end
    end
end

function initial_table = initialize_table_from_polynomial(polynomial, rows, columns)
    initial_table = sym(zeros(rows, columns+1));
    for k = 0:1:columns
        if (k*2+1) <= rows
            initial_table(1, k+1) = polynomial(k*2 + 1);
        else
            initial_table(1, k+1) = 0;
        end
        if (k*2+2) <= rows
            initial_table(2, k+1) = polynomial(k*2 + 2);
        else
            initial_table(2, k+1) = 0;
        end
    end
end

function has_all_zeros = has_row_of_zeros(htable, row)
    has_all_zeros = true;
    for col = htable(row, :)
        if col ~= 0
            has_all_zeros = false;
            return;
        end
    end
end

function swapped = swap_with_derivative(htable, row, order)
    swapped = htable;
    previous_row = htable(row-1,:);
    row_order = order-(row-1)+1;
    for k = 1:1:length(previous_row)
        swapped(row, k) = previous_row(k)*row_order;
        row_order = max(0, row_order-2);
    end
end