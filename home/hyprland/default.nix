{ pkgs, ... }:
{
    home.packages = with pkgs; [
        hyprland
        hyprpaper
        waybar
        rofi-wayland-unwrapped

        # mako
        dunst

        toastify  # command line notifications
        alacritty
        # wezterm
        xfce.thunar    # file manager

        # fonts
        jetbrains-mono
        font-awesome
        iosevka
        noto-fonts-cjk-sans
        noto-fonts-cjk-serif
    ];

    home.file.".config/hypr".source = ./hypr;
    home.file.".config/wallpaper/default.jpeg".source = ./wallpaper.jpeg;
    home.file.".config/waybar".source = ./waybar;
    home.file.".config/rofi".source = ./rofi;
    home.file.".config/ranger".source = ./ranger;
    home.file.".config/ranger".recursive = true;
    home.file.".config/dunst".source = ./dunst;
    
    home.file.".config/alacritty/alacritty.yml".text = ''
    window:
        opacity: 0.8
    '';
}