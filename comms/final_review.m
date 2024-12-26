%% PAM signal

% flat top PAM
fs = 8e3; 
T_pulse = 100e-6;

f = -100e3:0.1:100e3;
fs = 8e3;
Ts = 1/fs;
tau = 100e-6;

W_s = zeros(1, length(f));
for k = -6*fs:fs:6*fs
    W_s = W_s + trianglePulse(k, 3000, f);
end
sinc_env = abs(2*tau/Ts*sinc(tau*f));
W_f = sinc_env.*W_s;

figure;
plot(f, W_f);
hold on;
plot(f, sinc_env, "--");
hold off;
grid on;

%% 4 sources, each making 250 chars/s 
% interleaved unit is a char w/ 1 sync bit to each frame
% 1 data rate of each source
sources = 4;
char_rate = 250;
bits_per_char = 8;
source_data_rate = bits_per_char*char_rate
source_char_duration = 1/char_rate
chars_per_frame = 1;
frame_rate = char_rate/chars_per_frame
frame_duration = 1/frame_rate
bits_per_frame = sources*chars_per_frame*bits_per_char + 1
data_rate = char_rate/chars_per_frame*bits_per_frame

%% analog message 
Fs = 400000;
Ts = 1/Fs;
sample_period = 2/500; % 2 periods of a 500 Hz signal
t = 0:Ts:sample_period;
n = length(t);
Am = 5;
m_t = Am * cos(2*pi*500 * t);
fc = 10e3;
Ac = 10;

%% a) perc + and - modulation
Amax = Ac + Am
Amin = Ac - Am
pos_mod = (Amax - Ac)/Ac * 100
neg_mod = (Ac - Amin)/Ac * 100
perc_mod = (Amax - Amin)/2/Ac * 100

%% b) eval and sketch spectrum ~ fc = 10e3
s_t = (Ac + m_t) .* cos(2*pi*fc*t);
w_f = fft(s_t);

% figure
% tiledlayout(3, 1)
% nexttile
% plot(t, m_t);
% nexttile
% plot(t, s_t);
% nexttile
% semilogx(Fs/n*(0:n-1), abs(w_f));
% grid on

%% c) modulation efficiency
T_m = 1/(2*pi*500)
m_nap = 1/T_m * integral(@(t) (0.5 * cos(2*pi*500*t)).^2, 0, T_m)
mod_eff = m_nap/(1+m_nap)*100

%% d) normalized peak envelope power
P_pep = Ac^2/2 * (1 + 0.5)^2

%% 
Fs = 1e9; % 1 GHz
Ts = 1/Fs;
fc = 100e6;
Ac = 10;
fm = 1000;
Am = 5;
sample_period = 2/500; % 2 periods of a 500 Hz signal
t = 0:Ts:sample_period;
n = length(t);
m_of_t = @(x) Am*cos(2*pi*fm*x);
m_t = m_of_t(t);
% s_t = zeros(1, length(t));
% for i = 1:length(t)
%     s_t(i) = Ac*cos(2*pi*fc*t(i) + integral(m_of_t, 0, t(i)));
% end
w_sf = fft(s_t);

figure;
tiledlayout(3, 1);
nexttile
plot(t, m_t);
nexttile
plot(t, s_t);
nexttile
semilogx(Fs/n*(0:n-1), abs(w_sf));