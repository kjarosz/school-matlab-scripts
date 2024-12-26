function filtered = filter_noise(noisy_record)
    n = length(noisy_record.data);
    f0 = 4500; % Hz
    
    filtered = create_audio_record( ...
        noisy_record.input_device_id, ...
        noisy_record.output_device_id, ...
        noisy_record.sample_rate, ...
        noisy_record.bits ...
    );

    freq_indexes = linspace(0, 1, floor(n/2)+1);
    filter_order = 48;
    fir_filter = fir1(filter_order, freq_indexes(f0));
    filtered.data = fftfilt(fir_filter, noisy_record.data);

    figure;
    plot(abs(fft(fir_filter)));
    title("Fir Filter");
end
