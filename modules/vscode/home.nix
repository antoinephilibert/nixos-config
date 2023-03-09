{ pkgs, lib, ... }: 

{
    programs = {
        vscode = {
            enable = true;
            extensions = with pkgs.vscode-extensions; [
	           vscodevim.vim
            ];
        };
    };

    nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
     "vscode"
    ];
}