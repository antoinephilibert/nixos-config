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
    };

  outputs = inputs @ { self, nixpkgs, ... }:
    let                                    
      user = "antoine";
      location = "$HOME/.setup";
    in                                    
    {
      nixosConfigurations = (
        import ./hosts {    
          inherit (nixpkgs) lib;
          inherit inputs nixpkgs user location; 
        }
      );
    };
}
