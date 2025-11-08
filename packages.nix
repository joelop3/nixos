{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    google-chrome
    vscode
    ghostty
    gh
    git
    eza
    zoxide
    zsh
    zsh-powerlevel10k
    walker
    ironbar
    fnm
    bat
    
    
  ];
  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    nerd-fonts.fira-code
    nerd-fonts.caskaydia-mono
    nerd-fonts.caskaydia-cove
    nerd-fonts.monaspace
  ];
}
