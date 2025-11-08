{
  description = "NixOS 25.05 with Niri";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";

    home-manager.url = "github:nix-community/home-manager/release-25.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, ... }: {
    nixosConfigurations = {
      work-outeiroDev = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hardware-configuration.nix
	  ./packages.nix
          ./configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.joel = import ./home.nix;
            home-manager.backupFileExtension = "backup";
          }
        ];
      };
      
    };
  };
}
