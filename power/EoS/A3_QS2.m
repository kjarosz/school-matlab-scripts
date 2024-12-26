A3_QS1

fprintf("Transformer design\n");

OD_min = 0.0506;
OD_max = 0.0711; 
fprintf("%.5f m < OD < %.5f m\n", OD_min, OD_max);

N_cores = 1;
Np_max = 37;

P_p_cu_loss_max = 300e-3 ; % 300 mW
P_s_cu_loss_max = 50e-3 ; % 50 mW
fprintf("P_p_copper_loss < %.5f\n", P_p_cu_loss_max);
fprintf("P_s_copper_loss < %.5f\n", P_s_cu_loss_max);

fprintf("\n");

%% QS2.1 - Minimum inductance factor
A_L_min = (Lm * 1e9) / (Np_max^2); % in nH / T^2
fprintf("Lm in nH = %f * 1e9 = %.2f\n", Lm, (Lm * 1e9));
fprintf("A_L_min = Lm / (Np_max^2) = %f / %d^2 = %f [nH / T^2]\n\n", ...
    (Lm * 1e9), Np_max, A_L_min);

%% QS2.2 - Parts matching factor
catalog = CoreCatalog("MagneticsCoreSheet.csv");
catalog = catalog.filterByMinimumA_L(A_L_min);
catalog.printAvailableParts();
fprintf("\n");

%% QS2.3.a
LI2 = (Lm * 1e3) * Im^2;
fprintf("Lm in mH = %f * 1e3 = %f\n", Lm, (Lm * 1e3));
fprintf("LI2 = %f * %f^2 = %f\n", (Lm * 1e3), Im, LI2);

%% QS2.3.b -- Select parts
fprintf("Selecting parts:\n");

selected_cores = [ ...
    CoreCatalog.create_core_definition("26.9mm", ...
        0.02692, 0.02769, 0.01473, 0.01410, 0.01118, 0.01194, ...
        90, 113, "Xflux", 78934, 65.4, 63.5); ...
    CoreCatalog.create_core_definition("26.9mm", ...
        0.02692, 0.02769, 0.01473, 0.01410, 0.01118, 0.01194, ...
        160, 201, "HighFlux", 58928, 65.4, 63.5); ...
    catalog.selectLowestOD("Xflux"); ...
    catalog.selectLowestOD("HighFlux") ];
    
printTable(selected_cores(:, ["OD", "PartName", "PartNumber", "A_L"]));

fprintf("\nCalculating A_L_min\n")
selected_cores.A_L_min = selected_cores.A_L * (1 - 0.08);
printTable(selected_cores(:, ["OD", "PartName", "PartNumber", "A_L", "A_L_min"]));
fprintf("\n");

%% QS2.3.d -- Number of turns

fprintf("\nCalculating N_tunns:\n");
Lm_nH = Lm * 1e9;
printvar("Lm_nH", Lm_nH);

selected_cores = catalog.calculatePermeabilityAtBias(selected_cores, Lm_nH, Im);
selected_cores.n_primary_biased = ceil(selected_cores.n_primary ./ (selected_cores.Permeability_perc_reduction ./ 100));
selected_cores.L_adjusted = selected_cores.n_primary_biased.^2 .* (selected_cores.A_L .* selected_cores.Permeability_perc_reduction ./ 100) .* 1e-3;
selected_cores.n_primary_biased = int16(selected_cores.n_primary_biased);
selected_cores.n_primary = int16(selected_cores.n_primary);

printTable(selected_cores(:, ["OD", "PartName", "PartNumber", "n_primary", "H_bias_oe", "Permeability_perc_reduction", "n_primary_biased", "L_adjusted"]));


%% QS2.3.e -- AWG selection
fprintf("\nCalculating AWG and resistance:\n");

wire = struct( ...
    "AWG", 17, ...
    "rho", 0.01658, ... % ohm / meter
    "Area_cm2", 0.01177);

selected_cores.window_area = [ 156; 156; 452; 452];
selected_cores.winding_factor = double(selected_cores.n_primary_biased) .* (wire.Area_cm2 * 1e2) ./ selected_cores.window_area;
selected_cores.MLT = [ 37.5; 37.5; 70.7; 70.7]; % mm / turn -> * 10^-3 gives m / turn
selected_cores.primary_resistance = (selected_cores.MLT .* 1e-3) .* double(selected_cores.n_primary_biased) .* wire.rho;
selected_cores.primary_loss = Im * Im .* selected_cores.primary_resistance; 

printTable(selected_cores(:, ["PartNumber", "n_primary_biased", "window_area", "winding_factor", "MLT", "primary_resistance", "primary_loss"]));

%% QS2.3.g -- Secondary coil turns

fprintf("\nCalculating secondar coil turns:\n");

selected_cores.secondary_turns = selected_cores.n_primary_biased .* m;
printTable(selected_cores(:, ["PartNumber", "n_primary_biased", "secondary_turns"]));

%% QS2.3.h -- AWG secondary and loss

secondary_wire = struct( ...
    "AWG", 27, ...
    "rho", 0.16873, ... % ohm / meter
    "Area_cm2", 0.00131);

selected_cores.window_area = [ 156; 156; 452; 452];
selected_cores.winding_factor = double(selected_cores.secondary_turns) .* (secondary_wire.Area_cm2 * 1e2) ./ selected_cores.window_area;
selected_cores.MLT = [ 37.5; 37.5; 70.7; 70.7]; % mm / turn -> * 10^-3 gives m / turn
selected_cores.secondary_resistance = (selected_cores.MLT .* 1e-3) .* double(selected_cores.secondary_turns) .* secondary_wire.rho;
selected_cores.secondary_loss = Io * Io .* selected_cores.primary_resistance; 

printTable(selected_cores(:, ["PartNumber", "secondary_turns", "secondary_loss"]));

%% QS2.3.i -- Finalized transformer size

fprintf("\nFinal transformer size\n");

selected_cores.fortyWF_OD = [ 30; 30; 55; 55 ];
selected_cores.fortyWF_HT = [ 16.5; 16.5; 29; 29 ];
selected_cores.winding_factor = (double(selected_cores.n_primary_biased) .* (wire.Area_cm2 * 1e2) + double(selected_cores.secondary_turns) .* (secondary_wire.Area_cm2 * 1e2)) ./ selected_cores.window_area;

selected_cores.OD_wound = sqrt(selected_cores.winding_factor ./ 0.4 .* (selected_cores.fortyWF_OD.^2 - selected_cores.OD_nom.^2) + selected_cores.OD_nom.^2);
selected_cores.HT_wound = selected_cores.ID_nom + selected_cores.HT_nom - sqrt((1 - selected_cores.winding_factor)./0.6) .* (selected_cores.ID_nom + selected_cores.HT_nom - selected_cores.fortyWF_HT);

selected_cores.L = selected_cores.OD_wound;
selected_cores.W = selected_cores.OD_wound;
selected_cores.H = selected_cores.HT_wound;

printTable(selected_cores(:, ["PartNumber", "winding_factor", "fortyWF_OD", "fortyWF_HT", "OD_wound", "HT_wound", "L", "W", "H"]));