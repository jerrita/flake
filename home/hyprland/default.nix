{ pkgs, ... }:
{
    home.packages = with pkgs; [
        hyprland
        hyprpaper
        waybar
        rofi-wayland-unwrapped

        toastify  # command line notifications
    ];

    home.file.".config/hypr".source = ./config;
    home.file.".config/wallpaper/default.jpeg".source = ./wallpaper.jpeg;
    home.file.".config/waybar".source = ./waybar;
}