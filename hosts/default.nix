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
  system = "x86_64-linux";                                  # System architecture

  pkgs = import nixpkgs {
    inherit system;
    config.allowUnfree = true;                              # Allow proprietary software
    config.allowBroken = true;
  };

  lib = nixpkgs.lib;
in
{
  desktop = lib.nixosSystem {                               # Desktop profile
    inherit system;
    specialArgs = {
      inherit inputs user location;
      host = {
        hostName = "desktop";
      };
    };                                                      # Pass flake variable
    modules = [    
      ./desktop
      ./configuration.nix
      home-manager.nixosModules.home-manager {              # Home-Manager module that is used.
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.extraSpecialArgs = {
          inherit user;
          host = {
            hostName = "desktop";     #For Xorg iGPU  | Videocard 
          };
        };                                                  # Pass flake variable
        home-manager.users.${user} = {
          imports = [(import ./home.nix)] ++ [(import ./desktop/home.nix)];
        };
      }
    ];
  };
}
