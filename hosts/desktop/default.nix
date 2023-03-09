#
#  Specific system configuration settings for desktop
#
#  flake.nix
#   ├─ ./hosts
#   │   └─ ./desktop
#   │        ├─ default.nix *
#   │        └─ hardware-configuration.nix
#   └─ ./modules
#       ├─ ./desktop
#       │   ├─ ./hyprland
#       │   │   └─ default.nix
#       │   └─ ./virtualisation
#       │       └─ default.nix
#       ├─ ./programs
#       │   └─ games.nix
#       └─ ./hardware
#           └─ default.nix
#

{ pkgs, config, lib, inputs, user, ... }:

{
  imports =                                                
    [(import ./hardware-configuration.nix)] ++
    [(import ../../programs/default.nix)] ++
    [(import ../../programs/vscode.nix)];               

  boot = {
    kernelPackages = pkgs.linuxPackages_latest;

    loader = {
       systemd-boot.enable = true;
       efi.canTouchEfiVariables = true;
       efi.efiSysMountPoint = "/boot/efi";
    };
  };


  # Enable the X11 windowing system.
  services.xserver.enable = true;
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.stable;
  
  # hardware.nvidia.modesetting.enable = true;
  # hardware.opengl.enable = true;

  # Enable the KDE Plasma Desktop Environment.
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.desktopManager.plasma5.enable = true;

  # Configure keymap in X11
  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };

}
