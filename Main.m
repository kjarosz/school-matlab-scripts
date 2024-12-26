function Main()
    clean_audio = create_audio_record(0, 0, 44100, 16);
    
    clean_audio = record_audio(clean_audio, 2);
    play_and_plot_signal(clean_audio, "Clean Input");
    
    noisy_audio = add_noise_to_signal(clean_audio);
    play_and_plot_signal(noisy_audio, "Noisy Input");
    
    filtered_audio = filter_noise(noisy_audio);
    play_and_plot_signal(filtered_audio, "Filtered Input");
end