{ config, pkgs, ... }:
{
    environment.systemPackages = with pkgs; [
        gcc13
        cmake
        gnumake
        gdb
        python3
    ];
}