{ config, pkgs, ... }:
{
  imports =
    [ # Include the results of the hardware scan.
      ../../modules/sys.nix
      ../../modules/dev.nix
      ../../modules/nvidia.nix
      # ../../modules/prime.nix  # optimus, need busid first
      ../../modules/laptop.nix
      ./hardware-configuration.nix
    ];

  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "Jerrita-MSI"; 
  system.stateVersion = "23.05";
}
