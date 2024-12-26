function audio_record = create_audio_record(input_id, output_id, sample_rate, bits)
  audio_record.input_device_id = input_id;
  audio_record.output_device_id = output_id;
  audio_record.sample_rate = sample_rate;
  audio_record.bits = bits;
  audio_record.data = [];
end