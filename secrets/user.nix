{ pkgs, ... }: {
  users.users.<user_name_here> = {
    isNormalUser = true;
    description = "User Name";
    shell = pkgs.zsh; 
    extraGroups = [ "networkmanager" "wheel" "video" "audio" "bluetooth" ];
    packages = [ ];
  };
}