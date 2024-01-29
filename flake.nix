{
    description = "Jerrita's NixOS Flake";

    nixConfig = {
        experimental-features = [ "nix-command" "flakes" ];
        # substituters = [
        #     "https://mirrors.ustc.edu.cn/nix-channels/store"
        # ];

        # nix community's cache server
        extra-substituters = [
            "https://nix-community.cachix.org"
        ];
        extra-trusted-public-keys = [
            "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
        ];
    };

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";
        home-manager = {
            url = "github:nix-community/home-manager/release-23.11";
            inputs.nixpkgs.follows = "nixpkgs";
        };
        scripts = {
            url = "github:jerrita/scripts";
            inputs.nixpkgs.follows = "nixpkgs";
        };
        nix-vscode-extensions.url = "github:nix-community/nix-vscode-extensions";
    };

    outputs = { self, nixpkgs, home-manager, scripts, nix-vscode-extensions, ... } @ inputs: let
        inherit (self) outputs;
    in {
        nixosConfigurations = {
            aris = nixpkgs.lib.nixosSystem {
                system = "x86_64-linux";
                specialArgs = {inherit inputs outputs;};
                modules = [
                    ./hosts/aris
                    scripts.nixosModules.ddns
                    home-manager.nixosModules.home-manager
                    {
                        home-manager.useGlobalPkgs = true;
                        home-manager.useUserPackages = true;
                        home-manager.extraSpecialArgs = { hypr = false; };
                        home-manager.users.jerrita = import ./home;
                    }
                ];
            };
            cloud = nixpkgs.lib.nixosSystem {
                system = "x86_64-linux";
                specialArgs = {inherit inputs outputs;};
                modules = [
                    ./hosts/cloud

                    home-manager.nixosModules.home-manager
                    {
                        home-manager.useGlobalPkgs = true;
                        home-manager.useUserPackages = true;
                        home-manager.extraSpecialArgs = { hypr = false; };
                        home-manager.users.jerrita = import ./home;
                    }
                ];
            };
        };
    };
}
