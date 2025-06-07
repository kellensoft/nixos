{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./shared/base.nix
    ./hosts/home.nix
    ./secrets/user.nix
  ];
}
