{ config, pkgs, ... }:
{
    environment.systemPackage = with pkgs; [
        gcc13
        cmake
        gnumake
        gdb
    ];
}