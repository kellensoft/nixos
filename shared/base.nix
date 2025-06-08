{ config, pkgs, ... }:

{
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.networkmanager.enable = true;
  programs.nm-applet.enable = true;
  programs.light.enable = true;

  time.timeZone = "America/Chicago";

  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  services.pipewire = {
    enable = true;
    audio.enable = true;
    pulse.enable = true;
  };
  services.pulseaudio.enable = false;

  services.greetd = {
    enable = true;
    settings.default_session = {
      command = "${pkgs.greetd.tuigreet}/bin/tuigreet --user-menu --cmd Hyprland";
    };
  };

  services.xserver.enable = true;
  services.displayManager.defaultSession = "hyprland";

  programs.hyprland.enable = true;
  programs.zsh.enable = true;

  users.defaultUserShell = pkgs.zsh;

  environment.sessionVariables = {
    XCURSOR_THEME = "Catppuccin-Mocha-Sapphire-Cursors";
    XCURSOR_SIZE = "24";
    NIXOS_OZONE_WL = "1";
  };

  environment.systemPackages = with pkgs; [
    greetd.tuigreet
    wget
    zsh
    git
    gh
    w3m
    kitty
    wofi
    waybar
    swww
    wl-clipboard
    pavucontrol
    brightnessctl
    networkmanagerapplet
    neovim
    catppuccin-cursors.mochaSapphire
    openvpn3
    remmina
    blueman
  ];

  services.flatpak.enable = true;

  fonts.packages = with pkgs; [
    nerd-fonts._0xproto
    nerd-fonts.fira-code
    nerd-fonts.droid-sans-mono
    nerd-fonts.noto
    nerd-fonts.hack
    nerd-fonts.ubuntu
    nerd-fonts.symbols-only
  ];

  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;

  nixpkgs.config.allowUnfree = true;

  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-hyprland ];
    config.common.default = "hyprland";
  };

  system.stateVersion = "25.05";
}
