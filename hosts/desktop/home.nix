#
#  Home-manager configuration for desktop
#
#  flake.nix
#   ├─ ./hosts
#   │   └─ ./desktop
#   │       └─ ./home.nix
#

{ pkgs, ... }:

{
  home = {
    packages = with pkgs; [
	     google-chrome
	     firefox
    ];
  };
}
