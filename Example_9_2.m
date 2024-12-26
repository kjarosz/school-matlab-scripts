
Gu=zpk([ ],[0 -4 -6], 1)
Gc=zpk([-0.111],[-0.01],1);
Gce=Gu*Gc;
Tu=feedback(Gu,1);
Tc=feedback(Gce,1);
step(Tu)
hold
step(Tc)