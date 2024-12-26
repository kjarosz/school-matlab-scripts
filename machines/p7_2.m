Pm = 65
V = 25
Im_mag = 4.5

Ia_mag = 1.7
Pa = 32

[Im, Zm] = phase_current(V, Im_mag, Pm)

[Ia, Za] = phase_current(V, Ia_mag, Pa)

angle(Im - Ia)*180/pi