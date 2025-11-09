{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "work-outeiroDev";
  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Madrid";
  i18n.defaultLocale = "es_ES.UTF-8";

  environment.shells = with pkgs; [ zsh ];

  programs.niri.enable = true;
  programs.hyprland.enable = true;
  programs.hyprlock.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };
  programs.xwayland.enable = true;
  
  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.theme = "pixel_sakura";
  services.displayManager.sddm.wayland.enable = true;
  services.displayManager.sessionPackages = with pkgs; [ niri ];
  
  services.hypridle.enable = true;
  services.printing.enable = true;
  services.pulseaudio.enable = false;
  services.openssh.enable = true;

  services.xserver.xkb = {
    layout = "us";
  };

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  security.rtkit.enable = true;

  users.defaultUserShell = pkgs.zsh;

  users.users.joel = {
    isNormalUser = true;
    extraGroups = [ "networkmanager" "wheel" "root" "joel" ];
    shell = pkgs.zsh;
  };
  programs.zsh = {
    enable = true;

    enableCompletion = true;
    enableBashCompletion = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;

    histSize = 10000;

    shellAliases = {
      src = "source ~/.zshrc";
      esrc = "sudo nano /etc/nixos/dotfiles/zshrc";
      gt = "cd $(xplr)";
      coded = "code $(xplr)";
      xcode = "cage -- code";
      lk = "cd $(walk --icons --preview)";
      cat = "bat";
      ccat = "/usr/bin/cat";
      update = "sudo nixos-rebuild switch";
      packages = "sudo nano /etc/nixos/packages.nix";
      configuration = "sudo nano /etc/nixos/configuration.nix";
      flake = "sudo nano /etc/nixos/flake.nix";
      home = "sudo nano /etc/nixos/home.nix";
      dotfiles = "sudo cd /etc/nixos/dotfiles";
    };
    setOptions = [ "AUTO_CD" ];

    ohMyZsh = {
      enable = true;
      theme = "eastwood";
#      theme = "powerlevel10k/powerlevel10k";
      plugins = ["docker" "aliases" "zoxide" "eza" "fzf" "gh" "github" "fnm" "ssh-agent" "git" "sudo" "colored-man-pages" "extract" "command-not-found" ];
    };
  };  
  system.stateVersion = "25.05";
}
