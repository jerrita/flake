{ modulesPath, config, pkgs, lib, ... }:

with lib;

{
  imports =
    [ # Include the default lxd configuration.
      "${modulesPath}/virtualisation/lxc-container.nix"
      # Include the container-specific autogenerated configuration.
      ./lxd.nix
      ./orbstack.nix
    ];

  networking.useDHCP = false;
  networking.interfaces.eth0.useDHCP = true;

  environment.systemPackages = with pkgs; [
    vim
    git

    gcc13
    cmake
    gdb
  ];

  system.stateVersion = "21.05";

  documentation.enable = true;
  documentation.nixos.enable = true;
  environment.noXlibs = false;
  nix.settings.experimental-features = ["nix-command" "flakes"];
}