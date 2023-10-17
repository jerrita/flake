{
    description = "Jerrita's NixOS Flake";

    nixConfig = {
        experimental-features = [ "nix-command" "flakes" ];
        substituters = [
            "https://mirrors.ustc.edu.cn/nix-channels/store"
        ];

        # nix community's cache server
        extra-substituters = [
            "https://nix-community.cachix.org"
        ];
        extra-trusted-public-keys = [
            "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
        ];
    };

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
        home-manager = {
            url = "github:nix-community/home-manager/release-23.05";
            inputs.nixpkgs.follows = "nixpkgs";
        };
        nix-vscode-extensions.url = "github:nix-community/nix-vscode-extensions";
    };

    outputs = { self, nixpkgs, home-manager, nix-vscode-extensions, ... } @ inputs: let
        inherit (self) outputs;
    in {
        nixosConfigurations = {
            aris = nixpkgs.lib.nixosSystem {
                system = "aarch64-linux";
                specialArgs = {inherit inputs outputs;};
                modules = [
                    ./hosts/aris
                ];

                home-manager.nixosModules.home-manager
                {
                    home-manager.useGlobalPkgs = true;
                    home-manager.useUserPackages = true;
                    home-manager.extraSpecialArgs = inputs;
                    home-manager.users.jerrita = import ./home;
                }
            };
        };
    };
}
