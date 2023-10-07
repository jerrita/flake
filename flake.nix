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
            aris = nixpkgs.lib.nixosSystem {
                system = "aarch64-linux";
                specialArgs = {inherit inputs outputs;};
                modules = [
                    ./hosts/aris/configuration.nix
                ];
            };
        };

        homeConfigurations = {
            arm64 = home-manager.lib.homeManagerConfiguration {
                pkgs = nixpkgs.legacyPackages.aarch64-linux;
                extraSpecialArgs = {inherit inputs outputs;};
                modules = [
                    ./home.nix
                ];
            };
            x64 = home-manager.lib.homeManagerConfiguration {
                pkgs = nixpkgs.legacyPackages.x86_64-linux;
                extraSpecialArgs = {inherit inputs outputs;};
                modules = [
                    ./home.nix
                ];
            };
        };
    };
}
