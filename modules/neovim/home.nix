#
# Neovim
#

{ pkgs, lib, ... }:

{
    programs = {
        neovim = {
            enable = false;

            extraConfig = lib.fileContents ./init.vim;
        };
    };

}