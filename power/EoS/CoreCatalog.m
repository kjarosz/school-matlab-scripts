classdef CoreCatalog 
    %CORECATALOG Summary of this class goes here
    %   Based on Magnetics Powder Core Catalog
    
    properties
        cores
        perm_vs_dc_bias_curves
    end
    
    methods
        function obj = CoreCatalog(csv_file)
            %CORECATALOG Construct an instance of this class
            %   Detailed explanation goes here
            obj.cores = readtable(csv_file);
            obj.perm_vs_dc_bias_curves = CoreCatalog.create_perm_vs_dc_bias_curves();
        end
        
        function retObj = filterByMinimumA_L(obj, A_L_min)
            %METHOD1 Summary of this method goes here
            %   Detailed explanation goes here
            toDelete = obj.cores.A_L < A_L_min;
            obj.cores(toDelete, :) = [];
            retObj = obj;
        end

        function printAvailableParts(obj)
            %printAvailableParts Display parts in tex format

            printTable(obj.cores(:, ["OD", "PartName", "PartNumber", "A_L"]));
        end

        function targetCore = selectLowestOD(obj, PartType)
            core_table_size = size(obj.cores);
            nrows = core_table_size(1);
            lowestOD = -1;
            for i = 1:nrows
                core = obj.cores(i, :);
                PartName = core.PartName{1};
                OD_lim = core.OD_lim;
                if PartName == PartType && (OD_lim < lowestOD || lowestOD == -1)
                    targetCore = core;
                    lowestOD = OD_lim;
                end
            end
        end

        function ret_cores = calculatePermeabilityAtBias(obj, cores, L_nH, I)

            ret_cores = cores;
            ret_cores.n_primary = ceil(sqrt(L_nH ./ ret_cores.A_L_min));
            ret_cores.H_bias_oe = 4 * pi * I .* ret_cores.n_primary ./ ret_cores.Le_mm;

            biased_perm_percent = zeros(height(ret_cores), 1);
            for i = 1:height(ret_cores)
                core = ret_cores(i, :);
                biased_perm_percent(i) = obj.calculatePermPercentage( ...
                    core, core.H_bias_oe);
            end
            ret_cores.Permeability_perc_reduction = biased_perm_percent;
            ret_cores.Permeability_biased = ret_cores.Permeability .* (biased_perm_percent ./ 100);
        end

        function perm = calculatePermPercentage(obj, core, H_oe)
            perms = obj.perm_vs_dc_bias_curves;
            toDelete = perms.PartName ~= core.PartName;
            perms(toDelete, :) = [];
            toDelete = perms.Permeability ~= core.Permeability;
            perms(toDelete, :) = [];

            if height(perms) ~= 1
                fprintf("Did not filter properly\n");
                perm = 0;
            else
                curve = perms(1, :);
                perm = 1 / (curve.a + curve.b * H_oe^curve.c);
            end
        end
    end

    methods (Static)

        function perm_bias_table = create_perm_vs_dc_bias_curves()
            %create_perm_vs_dc_bias_curves Construct static data for
            %calculating permeability reduction based on DC bias
            %
            % Data sourced from Magnetic Powder Core Catalog 2020, pg 41
            perm_bias_table = cell2table( ...
                { ...
                    "Xflux",      19,    0.01,     4.976e-9,    2.236; ...
                    "Xflux",      26,    0.01,     6.304e-10,   2.714; ...
                    "Xflux",      40,    0.01,     1.843e-8,    2.358; ...
                    "Xflux",      60,    0.01,     1.489e-8,    2.613; ...
                    "Xflux",      75,    0.01,     2.269e-8,    2.649; ...
                    "Xflux",      90,    0.01,     9.841e-8,    2.477; ...
                    "Xflux",      125,   0.01,     2.687e-7,    2.477; ...
                    "HighFlux",   14,    0.01,     3.389e-8,    1.923; ...
                    "HighFlux",   26,    0.01,     4.205e-9,    2.426; ...
                    "HighFlux",   40,    0.01,     1.841e-8,    2.409; ...
                    "HighFlux",   60,    0.01,     6.413e-8,    2.291; ...
                    "HighFlux",   125,   0.01,     1.403e-7,    2.465; ...
                    "HighFlux",   147,   0.01,     1.207e-6,    2.131; ...
                    "HighFlux",   160,   0.01,     1.704e-6,    2.094  ...
                }, ...
                "VariableNames", ["PartName", "Permeability", "a", "b", "c"]);
        end

        function core = create_core_definition(OD, ...
                OD_nom, OD_lim, ...
                ID_nom, ID_lim, ...
                HT_nom, HT_lim, ...
                Permeability, A_L, ...
                PartName, PartNumber, ...
                Ae_mm2, Le_mm)
            core = struct2table(struct( ...
                "OD", { OD }, ...
                "OD_nom", OD_nom,  ...
                "OD_lim", OD_lim, ...
                "ID_nom", ID_nom,  ...
                "ID_lim", ID_lim, ...
                "HT_nom", HT_nom,  ...
                "HT_lim", HT_lim, ...
                "Permeability", Permeability,  ...
                "A_L", A_L, ...
                "PartName", { PartName },  ...
                "PartNumber", PartNumber, ...
                "Ae_mm2", Ae_mm2,  ...
                "Le_mm", Le_mm));
        end
    end
end

