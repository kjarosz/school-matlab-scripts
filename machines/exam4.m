B = 0.5
Hg = 0.5/(4*pi*10^-7)
lg = 0.001
Hc = 350
lc = 4*(0.1+0.025)

N = 500

I = (Hg*lg + Hc*lc)/N
V = I*4

Vc = 0.1*0.05*0.05*4 + 4*0.5^3
Vg = 0.5*0.5*0.001

Wf = B^2/2/(4*pi*10^-7) + Vc*Hc*B/2
Wf = Hg*Vg + Vc*Hc*B/2

fm = (0.5^2)/2/(4*pi*10^-7)*(0.05^2)