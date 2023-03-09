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
  imports = [
     ../../modules/vscode/home.nix
     ../../modules/neovim/home.nix
  ];

  home = {
    packages = with pkgs; [
	     google-chrome
	     firefox
    ];
  };
}
