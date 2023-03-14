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
  # imports =
    # (import ../modules/programs) ++
    # (import ../modules/services);

  home = {
    username = "${user}";
    homeDirectory = "/home/${user}";

    packages = with pkgs; [
    ];
    
    stateVersion = "23.05";
  };

  programs = {
    home-manager.enable = true;
  };

  programs.git = {
    enable = true;

    userName = "Antoine Philibert";
    userEmail = "antoine.philibert@gmail.com";
  };

  programs.bash = {
    enable = true;
    bashrcExtra = ''
       ssh-add ~/.ssh/id_rsa-github &> /dev/null
       ssh-add ~/.ssh/id_rsa-bitbucket &> /dev/null
       ssh-add ~/.ssh/id_rsa-centos-antoine &> /dev/null
       [[ -f ~/.bashrcExtra ]] && . ~/.bashrcExtra
    '';
  };

  programs.tmux = {
    enable = true;

    plugins = with pkgs; [
      tmuxPlugins.better-mouse-mode
    ];
  };

}
