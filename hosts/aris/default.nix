{ config, pkgs, ... }:
{
  imports =
    [ # Include the results of the hardware scan.
      ../../modules/sys.nix
      ../../modules/dev.nix
      ./hardware-configuration.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "aris"; 

  services.qemuGuest.enable = true;
  services.spice-vdagentd.enable = true;
  system.stateVersion = "23.05";
}
