function dump_audio_device_info()
  devinfo = audiodevinfo();
  disp("Inputs:")
  for input = devinfo.input
    fprintf("ID: %d\tName: %s\tDriver: %s\n", input.ID, input.Name, input.DriverVersion);
  end
  disp("Outputs:")
  for output = devinfo.output
    fprintf("ID: %d\tName: %s\tDriver: %s\n", input.ID, input.Name, input.DriverVersion);
  end
end