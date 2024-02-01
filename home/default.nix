{ pkgs, hypr, wd, tunnel, ... }:
let
    hyprland = if (hypr) then [ ./hyprland ] else [];
    waydroid = if (wd) then [ ./waydroid ] else [];
in
{
    imports = [
        ./programs
    ] ++ hyprland ++ waydroid;

    home = {
        username = "jerrita";
        homeDirectory = "/home/jerrita";
        stateVersion = "23.11";
    };

    programs.home-manager.enable = true;
}
