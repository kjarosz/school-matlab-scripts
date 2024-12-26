%% Buck Converter
%
% This example shows the operation of a buck converter. 

% Copyright 2016 Hydro-Quebec, and The MathWorks, Inc.

%%

open_system('BuckConverter')

%% Description
% A buck converter is a DC/DC power converter which steps down voltage from its input (source) to its output (load). In continuous conduction mode (current through the inductor never falls to zero), the theoretical transfer function of the buck converter is:
%
% $Vout / Vin = D$
%
% where $D$ is the duty cycle.
%
% In this example, the converter is feeding an RC load from a 200 V source and the PWM frequency is set to 10 kHz.

%% Simulation
% Run the simulation and observe waveforms on Scope1. At 3.5 ms, the duty
% cycle is increased from 0.5 to 0.75. Verify that the mean value of the
% load voltage (Vout) at the end of the simulation is very close to the
% theoretical value of: 0.75 * 200 = 150 V.

%%

