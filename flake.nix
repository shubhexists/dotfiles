{
    description = "Dotfiles";
    inputs = {
        nixpkgs.url = "nixpkgs/nixos-unstable";
        home-manager = {
            url = "github:nix-community/home-manager";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };
    outputs = {self, nixpkgs, home-manager, ...}: 
    let
        lib = nixpkgs.lib;
        system = "x86_64-linux"; 
        pkgs = nixpkgs.legacyPackages.${system};
    in {
        nixosConfigurations = {
            nixos = lib.nixosSystem {
                inherit system;
                modules = [ ./configuration.nix ];
            };
        };
        homeConfigurations = {
            jerry = home-manager.lib.homeManagerConfiguration {
                inherit pkgs;
                modules = [ ./home.nix ];
            };
        };
    };  
}
