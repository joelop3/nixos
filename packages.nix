{ pkgs, split-monitor-workspaces, ... }:

{
  environment.systemPackages = with pkgs; [
    networkmanagerapplet
    egl-wayland
    sddm-astronaut
    qt5.qtwayland
    pam_u2f
    killall

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
    wishlist
    vhs
    glow
    skate
    soft-serve
    freeze

    hyprpanel
    hyprpaper
    hyprlock
    hypridle
    hyprshot
    hyprsunset
    hyprpicker
    hyprcursor
    hyprpolkitagent

    bibata-cursors

    podman
    uv
    bun
    slack
    
    rclone-ui
    
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    nerd-fonts.fira-code
    nerd-fonts.caskaydia-mono
    nerd-fonts.caskaydia-cove
    nerd-fonts.monaspace
  ];
}
