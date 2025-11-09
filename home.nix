{ pkgs, split-monitor-workspaces, ... }:

{
  wayland.windowManager.hyprland.plugins = [
    split-monitor-workspaces.packages.${pkgs.system}.split-monitor-workspaces
    pkgs.hyprlandPlugins.hyprexpo
  ];
  home.stateVersion = "25.05";
  home.enableNixpkgsReleaseCheck = false;

  home.username = "joel";
  home.homeDirectory = "/home/joel";

  programs.git.enable = true;
  home.packages = with pkgs; [];
 
  home.file.".zshrc".source = ./dotfiles/zshrc;
  home.file.".config/ghostty/config".source = ./dotfiles/ghostty;
  home.file.".config/niri/config.kdl".source = ./dotfiles/niri;
  home.file.".config/hypr/hypridle.conf".source = ./dotfiles/hypr/hypridle.conf;
  home.file.".config/hypr/hyprland.conf".source = ./dotfiles/hypr/hyprland.conf;
  home.file.".config/hypr/hyprsunset.conf".source = ./dotfiles/hypr/hyprsunset.conf;
  home.file.".config/hypr/hyprlock.conf".source = ./dotfiles/hypr/hyprlock.conf;
  home.file.".config/hypr/hyprpaper.conf".source = ./dotfiles/hypr/hyprpaper.conf;
  home.file.".config/hypr/workspaces.conf".source = ./dotfiles/hypr/workspaces.conf;
  #home.file.".config/ironbar/config.toml".source = ./dotfiles/ironbar;
}
