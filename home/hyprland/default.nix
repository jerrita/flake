{ config, pkgs, ... }:
{
    home.packages = with pkgs; [
        hyprpaper
        waybar
        rofi-wayland-unwrapped

        toastify  # command line notifications
    ];

    programs.hyprland.enable = true;
    home.file.".config/hypr".source = ./config;
    home.file.".config/wallpaper/default.jpeg".source = ./wallpaper.jpeg;
    home.file.".config/waybar".source = ./waybar;
}