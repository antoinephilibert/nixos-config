#
#  General Home-manager configuration
#
#  flake.nix
#   ├─ ./hosts
#   │   └─ home.nix *
#   └─ ./modules
#       ├─ ./programs
#       │   └─ default.nix
#       └─ ./services
#           └─ default.nix
#

{ config, lib, pkgs, user, ... }:

{ 
  # imports =                                   # Home Manager Modules
    # (import ../modules/programs) ++
    # (import ../modules/services);

  home = {
    username = "${user}";
    homeDirectory = "/home/${user}";

    packages = with pkgs; [
    ];
    
    stateVersion = "22.11";
  };

  programs = {
    home-manager.enable = true;
  };
}
