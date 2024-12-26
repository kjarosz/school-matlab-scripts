function play_and_plot_signal(audio_record, stitle)
    play_audio(audio_record);
    plot_sound(audio_record.data, audio_record.sample_rate, stitle);
    Y = fftshift(fft(audio_record.data,1024));
    plot_fft_results(Y, audio_record.sample_rate, stitle);
end