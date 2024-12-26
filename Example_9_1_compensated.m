% Nidal Bazzi

'Example 9.1 Compensated '          % Display label.
clf                                 % Clear graph.
numgh=[1 -0.1];                       % Define numerator of G(s)H(s).
dengh=[0 -1 -2 -10]             % Define denominator of G(s)H(s).
'G(s)H(s)'                          % Display label.
GH=tf(numgh,dengh)                  % Create G(s)H(s) and display.
rlocus(GH)                          % Draw root locus.
z=0.15:0.01:0.2;                    % Define damping ratio values: 0.2 to
                                    % 0.5in steps of 0.05.
wn=0:1:10;                          % Define natural frequency values: 0 
                                    % to 10 in steps of 1.
sgrid(z,wn)                         % Generate damping ratio and natural 
                                    % frequency grid lines for root
                                    % locus.
title('Root Locus')                 % Define title for root locus.
'Hit Enter to Continue to Close-Up'
pause                               %Pause
rlocus(GH)                          % Draw close-up root locus.
axis([-12 5 -15 15])                % Define range on axes for root locus
                                    % close-up view.
title('Close-up')                   % Define title for close-up root
                                    % locus.
z=0.174;                            % Define damping ratio line for 
                                    % overlay on close-up root locus.
wn=0;                               % Suppress natural frequency overlay 
                                    % curves.
sgrid(z,wn)                         % Overlay damping ratio curve on
                                    % close-up root locus.
for k=1:10                          % Loop allows 3 points to be selected 
                                    % as per Example 8.7
                                    % (z=0.45, jw crossing, breakaway).
[K,p]=rlocfind(GH)                  % Generate gain, K, and closed-loop 
                                    % poles, p, 
                                    % for point selected interactively on
                                    % the root locus.
end                                 % End loop.

