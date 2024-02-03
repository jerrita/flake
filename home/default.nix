{ pkgs, hypr, wd, tunnel, ... }:
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
        stateVersion = "23.11";
    };

    programs.home-manager.enable = true;
}
