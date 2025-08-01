{
  description = "Home Manager configuration of j";

  inputs = {
    # Specify the source of Nixpkgs.
    stable.url = "github:NixOS/nixpkgs/nixos-24.05";
    master.url = "github:NixOS/nixpkgs/master"; 
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable"; # unstable branch is default
    staging.url = "github:NixOS/nixpkgs/staging";

    # Specify the source of Home Manager
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Specify the source of nix-flatpak
    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=v0.5.0";
  };

  outputs = { nixpkgs, home-manager, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      homeConfigurations."j" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        extraSpecialArgs = { inherit inputs; };

        # Specify your home configuration modules here, for example,
        # the path to your home.nix.
        modules = [
          inputs.nix-flatpak.homeManagerModules.nix-flatpak
          ./home.nix
          ./hyprland.nix
          ./files.nix
          ./packages.nix
          ./terminal.nix
          ./gaming.nix
          ./tools.nix
          ./development.nix
          ./other.nix
          ./niri.nix
        ];

        # Optionally use extraSpecialArgs
        # to pass through arguments to home.nix
      };
    };
}
