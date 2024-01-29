{ pkgs, ... }:
{
    home.packages = with pkgs; [
        # archiving
        zip
        unzip

        # utils
        screenfetch
        ranger
        file
        lsof
        strace
        htop
        sysstat
        thefuck
        pciutils
        
        # network
        mtr
        iperf3
        dnsutils
        ldns
        ipcalc
        iproute2
        nload

        nix-output-monitor
    ];

    programs = {
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

        command-not-found.enable = true;
    };
}