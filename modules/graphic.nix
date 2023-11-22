{ config, pkgs }:
{
    security.polkit.enable = true;

    hardware.opengl = {
        enable = true;
        driSupport = true;
    };
}