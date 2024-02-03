{ config, pkgs, proxmoxLXC, modulesPath, ... }:
{
  imports =
    [ # Include the results of the hardware scan.
      (modulesPath + "/virtualisation/proxmox-lxc.nix")
      ../../modules/sys.nix
      ../../modules/k3s.nix
      # ./hardware-configuration.nix
    ];

  nix.settings.experimental-features = ["nix-command" "flakes"];

  # boot.kernelPackages = pkgs.linuxPackages_latest;
  # boot.loader.systemd-boot.enable = true;
  # boot.loader.efi.canTouchEfiVariables = true;

  proxmoxLXC.privileged = true;
  proxmoxLXC.manageNetwork = true;

  networking.hostName = "aris";
  networking.useDHCP = true;
  
  # hardware.opengl.enable = true;
  # virtualisation.docker.enable = true;

  # services.qemuGuest.enable = true;
  system.stateVersion = "23.11";
}
