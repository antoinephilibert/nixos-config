{ pkgs, lib, inputs, config, ... }: 

{
    environment.systemPackages = with pkgs; [
      vscode
      vscode-extensions.vscodevim.vim
    ];

    nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
     "vscode"
    ];
}