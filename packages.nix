{ pkgs, split-monitor-workspaces, ... }:

{
  environment.systemPackages = with pkgs; [
    niri
    cage
    google-chrome
    vscode
    ghostty
    gh
    git
    eza
    zoxide
    fzf
    walker
    ironbar
    fnm
    bat
    zsh-powerlevel10k
    hyprpanel
    hyprpaper
    hyprlock
    hypridle
    hyprshot
    hyprsunset
    hyprpicker
    hyprcursor
    hyprpolkitagent
    killall
    bibata-cursors
    sddm-astronaut
    podman
    pam_u2f
    
    
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    nerd-fonts.fira-code
    nerd-fonts.caskaydia-mono
    nerd-fonts.caskaydia-cove
    nerd-fonts.monaspace
  ];
}
