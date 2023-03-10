
#  Main system configuration. More information available in configuration.nix(5) man page.
#
#  flake.nix
#   ├─ ./hosts
#   │   └─ configuration.nix *
#   └─ ./modules
#       ├─ ./editors
#       │   └─ default.nix
#       └─ ./shell
#           └─ default.nix
#

{ config, lib, pkgs, inputs, user, ... }:

{
  users.users.${user} = {
    isNormalUser = true;
    extraGroups = [ "networkmanager" "wheel" "docker" ];
    shell = pkgs.bash;
  };
  security.sudo.wheelNeedsPassword = false;

  networking.hostName = "nixos"; 
  networking.networkmanager.enable = true;
  
  virtualisation.docker.enable = true;

  time.timeZone = "America/Toronto";
  i18n = {
    defaultLocale = "en_CA.UTF-8";
    extraLocaleSettings = {
      LC_TIME = "en_CA.UTF-8";
      LC_MONETARY = "en_CA.UTF-8";
    };
  };

  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };

  security.rtkit.enable = true;
  security.polkit.enable = true;

  fonts.fonts = with pkgs; [ 
    carlito 
    vegur  
    source-code-pro
    jetbrains-mono
    font-awesome 
    corefonts
    (nerdfonts.override { 
      fonts = [
        "FiraCode"
      ];
    })
  ];

  services = {
    pipewire = { 
      enable = true;
      alsa = {
        enable = true;
        support32Bit = true;
      };
      pulse.enable = true;
      jack.enable = true;
    };
    openssh = { 
      enable = true;   
      allowSFTP = true; 
      extraConfig = ''
        HostKeyAlgorithms +ssh-rsa
      '';
    };
  };
  
  programs.ssh = {
    startAgent = true; 
  };

  nixpkgs.config.allowUnfree = true;
  system.stateVersion = "23.05";
}
