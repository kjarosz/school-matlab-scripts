clear
close

% Y-connected
P_rated = 195e6;
V_LL = 15e3;
f = 60;

OC_I_f = [  150    300   450    600    750  900    1200 ];
OC_V_LL = [ 3.75e3 7.5e3 11.2e3 13.6e3 15e3 15.8e3 16.5e3 ];

SC_I_f = 750
SC_I_a = 7000

%plot(OC_I_f, OC_V_LL)
%hold on
%grid on
%ylabel("V_{LL} (V)")
%xlabel("I_f (A)")

x = [0 OC_I_f];
OC_m_lin = 3.75e3/150
OC_m_sat = 15e3/750

%plot(x, x*OC_m_lin, "--")
%plot(x, x*OC_m_sat, "--")

%yyaxis right
%SC_m = SC_I_a/SC_I_f;
%;plot(x, SC_m * x)

%hold off

V_base = V_LL/sqrt(3)
I_base = 195e6/sqrt(3)/V_LL
Z_base = V_base/I_base

V_LL = OC_m_lin*750
V_phase_lin = V_LL/sqrt(3)
X_s_unsat = V_phase_lin/SC_I_a
X_s_unsat_pu = X_s_unsat/Z_base

V_phase_sat = OC_m_sat*750/sqrt(3)
X_s_sat = V_phase_sat/SC_I_a
X_s_sat_pu = X_s_sat/Z_base


% c
theta = acos(0.8)
I_a = 100e6/15e3/sqrt(3)*(cos(theta)+i*sin(theta))
display_Z("I_a", I_a)
V_phase = 15e3/sqrt(3)
Z_s_sat = i*X_s_sat
display_Z("Ia*Xs", I_a*Z_s_sat)
E_a = V_phase + I_a*Z_s_sat
display_Z("E_a", E_a)
I_f = abs(E_a)/V_phase*750
I_f_mag = abs(I_f)

abs(E_a)
E_a_lol = V_phase - (100e6)/(15e3)/sqrt(3)*0.8*X_s_sat