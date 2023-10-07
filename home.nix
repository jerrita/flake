{ config, pkgs, ... }:
{
    imports = [
        ./services/vscode-ssh-fix.nix
    ];

    home = {
        username = "jerrita";
        homeDirectory = "/home/jerrita";

        packages = with pkgs; [
            screenfetch
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
            htop
            sysstat
            thefuck

            pciutils

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
            zplug = {
                enable = true;
                plugins = [
                    { name = "zsh-users/zsh-autosuggestions"; }
                ];
            };

            oh-my-zsh = {
                enable = true;
                plugins = [ "git" "thefuck" ];
                theme = "sonicradish";
            };
        };

        home-manager.enable = true;
        command-not-found.enable = true;
    };

    services = {
        nixos-vscode-ssh-fix.enable = true;
    };
}
