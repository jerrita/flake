
{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "akari"; 

  time.timeZone = "Asia/Shanghai";

  programs.zsh.enable = true;
  programs.zsh.syntaxHighlighting.enable = true;
  users.users.jerrita = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    shell = pkgs.zsh;
  };

  security.sudo.wheelNeedsPassword = false;
  services.qemuGuest.enable = true;
  services.spice-vdagentd.enable = true;
  environment.systemPackages = with pkgs; [
    home-manager
    vim
    wget
    git

    gcc13
    cmake
    ninja
    gdb
  ];

  services.openssh.enable = true;
  nix.settings.experimental-features = ["nix-command" "flakes"];
  system.stateVersion = "23.05";
}

