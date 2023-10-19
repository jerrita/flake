# Use for firsh install
# nixos-install --option substituters "https://mirrors.cqupt.edu.cn/nix-channels/store"

{ config, pkgs, lib, ... }:
{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      # ./modules/tunnel.nix
    ];

  nix.settings.substituters = lib.mkForce [ "https://mirrors.cqupt.edu.cn/nix-channels/store" ];
  nix.settings.experimental-features = ["nix-command" "flakes"];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "scratch"; 
  time.timeZone = "Asia/Shanghai";

  programs.zsh.enable = true;
  programs.zsh.syntaxHighlighting.enable = true;
  users.users.jerrita = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    shell = pkgs.zsh;
  };

  environment.systemPackages = with pkgs; [
    vim
    git
    wget
  ];

  services.openssh.enable = true;
  system.stateVersion = "23.05";
}

