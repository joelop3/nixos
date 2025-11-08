{ pkgs, ... }:

{
  home.username = "joel";
  home.homeDirectory = "/home/joel";

  home.stateVersion = "25.05";

  programs.zsh.enable = true;
  programs.git.enable = true;

  home.packages = with pkgs; [
  ];

  home.file."zshrc".source = ./dotfiles/zshrc;
  home.file.".config/ghostty/config.toml".source = ./dotfiles/ghostty;
}
