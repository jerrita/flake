{ pkgs, hypr, tunnel, ... }:
let
    hyprland = if (hypr) then [ ./hyprland ] else [];
in
{
    imports = [
        ./programs
    ] ++ hyprland;

    home = {
        username = "jerrita";
        homeDirectory = "/home/jerrita";
        stateVersion = "23.05";
    };

    programs.home-manager.enable = true;
}
