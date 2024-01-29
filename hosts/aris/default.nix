{ config, pkgs, modulesPath, proxmoxLXC, ... }:
{
  imports =
    [ # LXC
      (modulesPath + "/virtualisation/proxmox-lxc.nix")
      ../../modules/sys.nix
      ../../modules/ddns.nix
      ../../modules/k3s.nix
    ];

  proxmoxLXC.privileged = true;
  proxmoxLXC.manageNetwork = true;
  networking.useDHCP = true;

  networking.hostName = "aris";
  system.stateVersion = "23.11";
}
