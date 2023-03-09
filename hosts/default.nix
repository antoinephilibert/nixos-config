#
#  These are the different profiles that can be used when building NixOS.
#
#  flake.nix 
#   └─ ./hosts  
#       ├─ default.nix *
#       ├─ configuration.nix
#       ├─ home.nix
#       └─ ./desktop 
#            ├─ ./default.nix
#            └─ ./home.nix 
#

{ lib, inputs, nixpkgs, home-manager, user, location, ... }:

let
  system = "x86_64-linux";                              

  pkgs = import nixpkgs {
    inherit system;
    config.allowUnfree = true;                        
    config.allowBroken = true;
  };

  lib = nixpkgs.lib;
in
{
  desktop = lib.nixosSystem {                           
    inherit system;
    specialArgs = {
      inherit inputs user location;
      host = {
        hostName = "desktop";
      };
    };                  
    modules = [    
      ./desktop
      ./configuration.nix
      home-manager.nixosModules.home-manager {          
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.extraSpecialArgs = {
          inherit user;
          host = {
            hostName = "desktop";
          };
        };                       
        home-manager.users.${user} = {
          imports = [(import ./home.nix)];
        };
      }      
    ];
  };
}
