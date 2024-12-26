Gu=zpk([ ],[-1 -2 -10],164.6)
Gc=zpk([-0.111],[-0.01],1);
Gce=Gu*Gc;
Tu=feedback(Gu,1);
Tc=feedback(Gce,1);
step(Tu)
hold
step(Tc)