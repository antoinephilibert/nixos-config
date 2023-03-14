{ pkgs, lib, inputs, config, ... }: 

{
    environment.systemPackages = with pkgs; [
      vscode
      vscode-extensions.vscodevim.vim
      vscode-extensions.redhat.java
      vscode-extensions.redhat.vscode-yaml
      vscode-extensions.vscjava.vscode-maven
      vscode-extensions.vscjava.vscode-java-test
      vscode-extensions.vscjava.vscode-java-dependency
      vscode-extensions.vscjava.vscode-java-debug
    ];

    nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
     "vscode"
    ];
}
