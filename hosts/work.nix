{config, pkgs, ... }: {
  networking.hostName = "work";

  services.xserver.videoDrivers = [ "amdgpu" ];
  
  powerManagement.enable = true;
  services.auto-cpufreq.enable = true;
  services.libinput.enable = true;
  programs.light.enable = true;
}
