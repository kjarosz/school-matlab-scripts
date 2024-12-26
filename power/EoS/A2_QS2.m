A2_QS1

D_op = 0.6673
Ton = Ts*D_op

delta_I_L = Vo/L_min*(1-D_op)*Ts

%% Capacitor Waveforms

t_start = 0.04;         % 40 ms
t_end = t_start + 2*Ts; % give me two full cycles

t = transpose(capacitor_waveforms.time);
i_L_sig = transpose(capacitor_waveforms.signals(1).values);
i_C_sig = transpose(capacitor_waveforms.signals(2).values);
v_C_sig = transpose(capacitor_waveforms.signals(3).values);

i_start = find_first(t >= t_start);
i_end = find_first(t >= t_end);
i_range = i_start:i_end;
i_delta = i_end-i_start;

t_range = t(i_range);
t_range = t_range - t_range(1);
i_L_ydata = round(i_L_sig(i_range), 2);
i_C_ydata = round(i_C_sig(i_range), 2);
v_C_ydata = round(v_C_sig(i_range), 2);

close;
fig = figure;
setFigureProperties(fig);
tiledlayout(3, 1);

%% inductor current
nexttile
axes1 = gca;
hold(axes1, 'on');

plot(t_range, i_L_ydata);

xlim([min(t_range) max(t_range)])

i_L_minmax = [(I_L - delta_I_L/2) (I_L + delta_I_L/2)];

yline(Io, '--b', 'I_o = I_L', 'FontSize', 12)
yline(i_L_minmax(1), '--r', 'FontSize', 12)
yline(i_L_minmax(2), '--r', 'FontSize', 12)

xline(Ton, '--', 't_{on}', 'LabelVerticalAlignment', 'bottom','FontSize', 12);
xline(Ts, '--', 'T_S', 'FontSize', 12);

plot([Ton Ton], ...
    i_L_minmax, ...
    'DisplayName','\Delta I_L', ...
    'Color', [0.2 1 0.2], ...
    'Tag','DisplayLine1');
text(Ton, i_L_minmax(1) + delta_I_L*0.25, '\Delta i_L');

% Tick marks
i_L_ymin = (i_L_minmax(1) - delta_I_L*0.25);
i_L_ymax = (i_L_minmax(2) + delta_I_L*0.25);
i_L_yticks = round([i_L_ymin ...
    (i_L_minmax(1)) ...
    (Io) ...
    (i_L_minmax(2)) ...
    i_L_ymax], 2);
yticks(i_L_yticks);
ylim(round([i_L_ymin i_L_ymax], 2));

ylabel("i_L(t) A", "Interpreter", "tex");
xticklabels('')
xticks([0 Ton Ts (Ts+Ton) 2*Ts]);

box(axes1, 'on');
hold(axes1, 'off');

%% capacitor current
nexttile
axes2 = gca;
hold(axes2, 'on');

i_C_minmax = [min(i_C_ydata) max(i_C_ydata)];
delta_i_C = i_C_minmax(2) - i_C_minmax(1);

plot(t_range, i_C_ydata);
xlim([min(t_range) max(t_range)]);

xticklabels('')
xticks([0 Ton Ts (Ts+Ton) 2*Ts]);
ylabel('i_C(t) A', 'Interpreter', 'tex');

xline(Ton, '--', 't_{on}', 'LabelVerticalAlignment', 'bottom','FontSize', 12);
xline(Ts, '--', 'T_S', 'FontSize', 12);

yline(delta_i_C/2, '--r', 'FontSize', 12);
yline(-delta_i_C/2, '--r', 'FontSize', 12);

T0 = Ton/2;
Ta = (Ts-Ton)/2+Ton - T0;
xline(T0, "--", "t_0", 'FontSize', 12);
xline(T0+Ta, '--', 't_0 + t_a', 'FontSize', 12);

plot([(T0 + Ts) (T0 + Ts)], ...
    [-delta_i_C/2 delta_i_C/2], ...
    '-g')
text(T0 + Ts, -delta_i_C/2 + delta_i_C*0.25, '\Delta i_C');

i_C_yticks = [(i_C_minmax(1) - delta_i_C*0.25) ...
    i_C_minmax(1) ...
    0 ...
    i_C_minmax(2) ...
    (i_C_minmax(2) + delta_i_C*0.25)];
yticks(round(i_C_yticks, 2));
ylim(round([i_C_yticks(1) i_C_yticks(5)], 2));

box(axes2, 'on');
hold(axes2, 'off');

%% capacitor voltage
nexttile
axes3 = gca;
hold(axes3, 'on');

plot(t_range, v_C_ydata);

xlim([min(t_range) max(t_range)]);
ylabel("v_C(t) V", 'Interpreter','tex');

xline(Ton, '--', 't_{on}', 'LabelVerticalAlignment', 'bottom','FontSize', 12);
xline(Ts, '--', 'T_S', 'FontSize', 12);

xline(T0, "--", "t_0", 'FontSize', 12);
xline(T0+Ta, '--', 't_0 + t_a', 'LabelVerticalAlignment', 'bottom','FontSize', 12);

v_C_minmax = [min(v_C_ydata) max(v_C_ydata)]; 
delta_V_o = v_C_minmax(2) - v_C_minmax(1);
yline(v_C_minmax, '--r', '\Delta V_C', 'FontSize', 12);
yline(Vo, '--b', 'V_o', 'FontSize', 12);

% y - Ticks and limits
v_C_ymin = (v_C_minmax(1) - delta_V_o*0.25);
v_C_ymax = (v_C_minmax(2) + delta_V_o*0.25);
v_C_yticks = round([v_C_ymin ...
    (v_C_minmax(1)) ...
    (Vo) ...
    (v_C_minmax(2)) ...
    v_C_ymax], 2);
yticks(v_C_yticks);
ylim(round([v_C_ymin v_C_ymax], 2));

x_ticks = [0 T0 Ton (T0+Ta) Ts (Ts+Ton) 2*Ts];
xticks(x_ticks);
xticklabels(round(x_ticks*10^6, 1));
xtickangle(30);
xlabel("Time (\mus)");