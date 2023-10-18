# Use for firsh install
{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

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
    home-manager
  ];

  services.openssh.enable = true;
  nix.settings.experimental-features = ["nix-command" "flakes"];
  nix.settings.substituters = [ "https://repo.mirrors.cqupt.edu.cn/repository/nix-channels/store" ];
  system.stateVersion = "23.05";
}

