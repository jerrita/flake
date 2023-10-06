{
    description = "Jerrita's NixOS Flake";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-23.05";
        home-manager = {
            url = "github:nix-community/home-manager/release-23.05";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };

    outputs = { self, nixpkgs, home-manager, ... } @ inputs: let
        inherit (self) outputs;
    in {
        nixosConfigurations = {
            akari = nixpkgs.lib.nixosSystem {
                system = "aarch64-linux";
                specialArgs = {inherit inputs outputs;};
                modules = [
                    ./hosts/akari/configuration.nix

                    home-manager.nixosModules.home-manager
                    {
                        home-manager.useGlobalPkgs = true;
                        home-manager.useUserPackages = true;
                        home-manager.users.jerrita = import ./home.nix;
                    }
                ];
            };
        };
    };
}
