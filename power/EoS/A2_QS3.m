A2_QS1

D_op = 0.5
Ton = Ts*D_op

Vi = 72
L_min = 0.7 * L_min

delta_I_L = Vo/L_min*(1-D_op)*Ts

%% Inductor waveforms

t_start = 0.04; 
t_end = t_start + 2*Ts;

t = transpose(inductorWaveformData.time);
v_L_sig = transpose(inductorWaveformData.signals(1).values);
i_L_sig = transpose(inductorWaveformData.signals(2).values);

i_start = find_first(t >= t_start);
i_end = find_first(t >= t_end);
i_range = i_start:i_end;
i_delta = i_end-i_start;

t_range = t(i_range);
t_range = t_range - t_range(1);

x_lim = [min(t_range) max(t_range)];

v_L_ydata = v_L_sig(i_range);
i_L_ydata = i_L_sig(i_range);

textSize = 18;

%% figure
close
fig = figure;
setFigureProperties(fig);
tiledlayout(2, 1);

%% inductor current
nexttile
axes1 = gca;
hold(axes1, 'on');

plot(t_range, v_L_ydata);

% Lines
top = max(v_L_ydata);
bottom = min(v_L_ydata);
yline(top, '--r', 'V_i - V_o');
yline(bottom, '--r', '-V_o');

td_start = 3.53926e-5;
xline(Ton, '--b', 't_{on}', 'FontSize', textSize);
xline(td_start, '--b', 't_{off,2}', 'FontSize', textSize);
xline(Ts, '--b', 'T_s', 'FontSize', textSize, 'LabelVerticalAlignment','bottom');

plot([td_start Ts], ...
    [-20 -20], ...
    '-r')
text(Ts*1.05, -20, "t_d", 'FontSize', textSize);

% Axes properties
xlim(x_lim);

v_L_min = min(v_L_ydata);
v_L_max = max(v_L_ydata);
v_L_delta = v_L_max - v_L_min;
v_L_ymin = v_L_min - v_L_delta*0.25;
v_L_ymax = v_L_max + v_L_delta*0.25;
v_L_yticks = round([v_L_ymin ...
    v_L_min ...
    0 ...
    v_L_max ...
    v_L_ymax], 2);
yticks(v_L_yticks);
ylim(round([v_L_ymin v_L_ymax], 2));
ylabel('v_L(t) [V]', 'Interpreter','tex');

xticklabels('');
xticks([0 Ton td_start Ts (Ts+Ton) 2*Ts]);

box(axes1, 'on');
hold(axes1, 'off');

%% inductor current
nexttile
axes2 = gca;
hold(axes2, 'on');

plot(t_range, i_L_ydata);

% Lines
td_start = 3.53926e-5;
i_L_min = min(i_L_ydata);
i_L_max = max(i_L_ydata);
I_L = (Ton*i_L_max/2 + (td_start-Ton)*i_L_max/2)/Ts
yline(I_L, "--b", "I_L", 'FontSize', textSize);

xline(Ton, '--b', 't_{on}', 'FontSize', textSize);
xline(td_start, '--b', 't_{off,2}', 'FontSize', textSize);
xline(Ts, '--b', 'T_s', 'FontSize', textSize);

% Axes properties
xlim(x_lim);

i_L_delta = i_L_max - i_L_min;
i_L_ymin = i_L_min - i_L_delta*0.25;
i_L_ymax = i_L_max + i_L_delta*0.25;
i_L_yticks = round([0 ...
    I_L ...
    i_L_max ...
    i_L_ymax], 2);
yticks(i_L_yticks);
ylim(round([0 i_L_ymax], 2));
ylabel('i_L(t) [A]', 'Interpreter','tex');

xticklabels(round([0 Ton td_start Ts (Ts+Ton) 2*Ts]*10^6, 2));
xticks([0 Ton td_start Ts (Ts+Ton) 2*Ts]);
xlabel("Time (\mus)");

box(axes2, 'on');
hold(axes2, 'off');

%% 
td = (1 - 2*I_L/(i_L_max))*Ts
