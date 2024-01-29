{ config, pkgs, modulesPath, ... }:
{
  imports =
    [ # LXC
      (modulesPath + "/virtualisation/proxmox-lxc.nix")
      ../../modules/sys.nix
      ../../modules/ddns.nix
      ../../modules/k3s.nix
    ];

  networking.hostName = "aris";
  system.stateVersion = "23.11";
}
