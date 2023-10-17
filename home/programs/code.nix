# code server fix

{ pkgs, ... }: {
    imports = [ ../../services/nixos-vscode-ssh-fix.nix ];
    services = {
        nixos-vscode-ssh-fix.enable = true;
    };
}