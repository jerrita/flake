{ config, pkgs, ... }:
{
    imports = [
        ./programs
        if (hypr) then ./hyprland else null
    ];

    home = {
        username = "jerrita";
        homeDirectory = "/home/jerrita";
        stateVersion = "23.05";
    };

    programs.home-manager.enable = true;
}
