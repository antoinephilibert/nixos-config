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

{ pkgs, lib, user, ... }:

{
  imports =                                                # For now, if applying to other system, swap files
    [(import ./hardware-configuration.nix)];               # Current system hardware config @ /etc/nixos/hardware-configuration.nix

  boot = {                                      # Boot options
    kernelPackages = pkgs.linuxPackages_latest;

    loader = {                                   # For legacy boot
      grub = {
        enable = true;
        version = 2;
        device = "/dev/sda";                    # Name of hard drive (can also be vda)
      };
      timeout = 10;                              # Grub auto select timeout
    };
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the KDE Plasma Desktop Environment.
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.desktopManager.plasma5.enable = true;

  # Configure keymap in X11
  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };
}
