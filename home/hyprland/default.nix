{ pkgs, ... }:
{
    home.packages = with pkgs; [
        hyprland
        hyprpaper
        waybar
        rofi-wayland-unwrapped

        toastify  # command line notifications
        alacritty
        # wezterm
        thunar    # file manager

        # fonts
        jetbrains-mono
        font-awesome
    ];

    home.file.".config/hypr".source = ./config;
    home.file.".config/wallpaper/default.jpeg".source = ./wallpaper.jpeg;
    home.file.".config/waybar".source = ./waybar;
}