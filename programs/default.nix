{ pkgs, lib, inputs, config, ... }: 

{
 environment = {
    variables = {
      #TERMINAL = "alacritty";
      EDITOR = "vim";
      VISUAL = "vim";
    };
    systemPackages = with pkgs; [
      vim
      killall
      nano
      pciutils
      usbutils
      wget
      gcc
      google-chrome
      firefox
      neovim
      gnumake
      nodejs
      cargo
      nb
      bash
    ];
  };
}
