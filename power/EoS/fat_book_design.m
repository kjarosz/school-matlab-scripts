function fat_book_design(Vi, Vo, Io, fs, D, B_max, P_cu)
  m = (1 - D)/D * (Vo / Vi)
  Im = m / (1 - D) * Io

  % Fat book says maximum I_m_delta = .2 * Im
  % WARNING: Unlike other delta quantities, this is Im_peak - Im_avg... not
  % Im_peak-to-peak
  I_m_delta = .2 * Im

  I_m_max = Im + I_m_delta

  Lm = Vi * D * (1 / fs) / 2 / I_m_delta

  I1 = Im*sqrt(D)*sqrt(1 + (1/3)*(I_m_delta/Im)^2)

  I2 = (1/m)*Im*sqrt(1-D)*sqrt(1 + (1/3)*(I_m_delta/Im)^2)

  Itot = I1 + m*I2

  Ku = 0.3;
  rho = 1.724e-6;
  Kg = rho * Lm^2 * Itot^2 * I_m_max^2 / B_max^2 / P_cu / Ku * 10^8
end