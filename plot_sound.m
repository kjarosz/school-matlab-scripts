function plot_sound(y,Fs, stitle)
    x = 1:length(y);
    x = x./Fs;
    figure;
    plot(x, y);
    title(stitle);
    xlabel("Time (s)");
    ylabel("Amplitude");
end

