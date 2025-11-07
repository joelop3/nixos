{ pkgs, ... }:

{
  home.username = "joel";
  home.homeDirectory = "/home/joel";

  home.stateVersion = "25.05";

  programs.zsh.enable = true;

  home.packages = with pkgs; [
    git
    gh
    vscode
    google-chrome
    ghostty
  ];
}
