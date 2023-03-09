#  flake.nix *             
#   ├─ ./hosts
#   │   └─ default.nix
#   └─ ./nix
#       └─ default.nix
#

{
  description = "NixOS System Flake Configuration";

  inputs =
    {
      nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

      home-manager = {
        url = "github:nix-community/home-manager";
        inputs.nixpkgs.follows = "nixpkgs";
      };
    };

  outputs = inputs @ { self, nixpkgs, home-manager, ... }:
    let                                    
      user = "antoine";
      location = "$HOME/.setup";
    in                                    
    {
      nixosConfigurations = (
        import ./hosts {    
          inherit (nixpkgs) lib;
          inherit inputs nixpkgs home-manager user location; 
        }
      );

      homeConfigurations = (     
        import ./nix {
          inherit (nixpkgs) lib;
          inherit inputs nixpkgs home-manager user;
        }
      );

    };
}
