function printTable(tbl)
    cols = tbl.Properties.VariableNames;
    ncols = width(cols);

    fprintf("\\begin{longtable}[c]{| ")
    for i = 1:ncols
        fprintf(" c |");
    end
    fprintf("}\n");
    
    for i = 1:2
        fprintf("\\hline\n");
        for i = 1:ncols
            if i == ncols
                fprintf("%s \\\\\n", cols{1, i});
            else
                fprintf("%s & ", cols{1, i});
            end
        end
        if i == 1
            fprintf("\\hline\n\\endfirsthead\n\n");
        else
            fprintf("\\hline\n\\endhead\n\n");
        end
    end

    types = tbl.Properties.VariableTypes;
    core_table_size = size(tbl);
    nrows = core_table_size(1);
    for i = 1:nrows
        core = tbl(i, :);
        for j = 1:ncols
            type = types{1, j};
            if type == "double"
                if floor(core{1, j}) == core{1, j}
                    fprintf("%d ", floor(core{1, j}));
                else
                    fprintf("%.4f ", core{1, j});
                end
            elseif type == "int16"
                fprintf("%d ", core{1, j});
            else
                fprintf("%s ", core{1, j}{1});
            end
            if j == ncols
                fprintf("\\\\\n");
            else
                fprintf("& ");
            end
        end
    end

    fprintf("\\hline\n")
    fprintf("\\end{longtable}\n");
end

