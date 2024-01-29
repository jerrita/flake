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

  networking.hostName = "cloud"; 

  services.qemuGuest.enable = true;
  system.stateVersion = "23.11";
}
