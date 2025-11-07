{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    google-chrome
    vscode
    ghostty
    gh
    git
  ];
}
