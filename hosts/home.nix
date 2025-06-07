{ config, pkgs, ... }: {
  networking.hostName = "home";

  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    open = true;
    nvidiaSettings = true;
  };
  
  services.thermald.enable = true;
  services.auto-cpufreq.enable = true;
}
