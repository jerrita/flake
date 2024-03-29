{ config, pkgs, ... }: 
{
    # time zone
    time.timeZone = "Asia/Shanghai";
    i18n.defaultLocale = "en_US.UTF-8";
    i18n.extraLocaleSettings = {
        LC_ADDRESS = "zh_CN.UTF-8";
        LC_IDENTIFICATION = "zh_CN.UTF-8";
        LC_MEASUREMENT = "zh_CN.UTF-8";
        LC_MONETARY = "zh_CN.UTF-8";
        LC_NAME = "zh_CN.UTF-8";
        LC_NUMERIC = "zh_CN.UTF-8";
        LC_PAPER = "zh_CN.UTF-8";
        LC_TELEPHONE = "zh_CN.UTF-8";
        LC_TIME = "zh_CN.UTF-8";
    };

    environment.systemPackages = with pkgs; [
        vim
        wget
        git
        sysstat
        lshw
        lm_sensors
        screenfetch
    ];

    security.sudo.wheelNeedsPassword = false;
    services.openssh.enable = true;

    programs.zsh.enable = true;
    programs.zsh.syntaxHighlighting.enable = true;
    users.defaultUserShell = pkgs.zsh;
    users.users.jerrita = {
        isNormalUser = true;
        extraGroups = [ "wheel" "docker" ];
        openssh.authorizedKeys.keys = [
            "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINu+Alullj1Meq+a3KNFlIT9lU9YCb8WDr/mZhHCEPji jerrita@mac-air"
        ];
    };
}
