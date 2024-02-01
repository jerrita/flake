{ config, pkgs, ... }:
{
  imports =
    [ # Include the results of the hardware scan.
      ../../modules/sys.nix
      ./hardware-configuration.nix
    ];

  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "aris";
  hardware.opengl.enable = true;

  virtualisation.docker.enable = true;
  # virtualisation.waydroid.enable = true;

  services.qemuGuest.enable = true;
  system.stateVersion = "23.11";
}
