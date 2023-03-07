{ config, lib, pkgs, host, ... }:

{
    programs = {
        hyprland = {
            enable = true;
            #nvidiaPatches = with host; if hostName == "work" then true else false;
        };
    };

}