{ pkgs, ... }:
{
    home.packages = [pkgs.gh];
    programs.git = {
        enable = true;
        userName = "jerrita";
        userEmail = "je5r1ta@icloud.com";
    };
}