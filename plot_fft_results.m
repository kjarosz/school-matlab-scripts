function plot_fft_results(Y, sampling_rate, stitle)
    n = length(Y);
    split_normalized_x = sampling_rate*(0:n/2)/n;
    halfY = Y(n/2:end);
    
    figure;
    semilogx(split_normalized_x, abs(halfY));
    title(sprintf("%s - Frequency Response", stitle));
    xlabel("Frequency (Hz)");
    ylabel("Magnitude (dB)");
end
