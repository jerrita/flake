{ config, pkgs, ... }:
{
    imports = [
        ./programs
    ];

    home = {
        username = "jerrita";
        homeDirectory = "/home/jerrita";
        stateVersion = "23.05";
    };

    programs.home-manager.enable = true;
}
