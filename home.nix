{ config, pkgs, ... }:
{
    home = {
        username = "jerrita";
        homeDirectory = "/home/jerrita";

        packages = with pkgs; [
            neofetch
            nnn
            vim
            
            mtr
            iperf3
            dnsutils
            ldns
            ipcalc
            iproute2

            file
            lsof
            strace
            btop
            sysstat

            nix-output-monitor
        ];

        stateVersion = "23.05";
    };

    programs = {
        git = {
            enable = true;
            userName = "jerrita";
            userEmail = "je5r1ta@icloud.com";
        };

        zsh = {
            enable = true;
            enableAutosuggestions = true;
            enableCompletion = true;
            shellAliases = {
                k = "kubectl";
                update = "sudo nixos-rebuild switch";
            };
            oh-my-zsh = {
                enable = true;
                plugins = [ "git" "thefuck" "zsh-syntax-highlighting" ];
                theme = "random";  # I am hentai
            };
        };

        home-manager.enable = true;
    };
}