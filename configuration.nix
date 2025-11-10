{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking = {
    hostName = "work";
    domain = "outeiro.dev";
    networkmanager.enable = true;
    #wireless.enable = true;
  };

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
  services.displayManager.sddm.wayland.enable = true;
  services.displayManager.sessionPackages = with pkgs; [ niri hyprland ];
  
  services.resolved.enable = true;

  services.hypridle.enable = true;
  services.printing.enable = true;
  services.pulseaudio.enable = false;
  services.openssh.enable = true;
  services.xserver.xkb.layout = "us";

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  security.rtkit.enable = true;

  security.pam.u2f.enable = true;
  security.pam.u2f.settings.authFile = "/etc/nixos/u2f_keys";
  security.pam.services = {
    login.u2fAuth = true;
    sudo.u2fAuth = true;
    sshd.u2fAuth = true;
  };

  virtualisation = {
    containers.enable = true;
    podman = {
      enable = true;
      dockerCompat = true;
      defaultNetwork.settings.dns_enabled = true;
    };
  };

  users.defaultUserShell = pkgs.zsh;

  users.users.joel = {
    isNormalUser = true;
    extraGroups = [ "networkmanager" "wheel" "root" "podman" "joel" ];
    shell = pkgs.zsh;
    hashedPassword = "$y$j9T$Rz8zMhJvH/Z/W8PLjj3Gb.$ZSvkeyko6NM4qWXIX7O5LPHD3eK7TdJAwYnYZGgFwg0";
    openssh.authorizedKeys.keys = [ "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMuWjZrDWhOrn6JfNak6nTczDsk9C+3RG4rqBJotYwdZ joel@outeiro.com" ];
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
    promptInit = "source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
    ohMyZsh = {
      enable = true;
#      theme = "eastwood";
#      theme = "powerlevel10k/powerlevel10k";
      plugins = [ "aliases" "zoxide" "eza" "fzf" "gh" "github" "fnm" "ssh-agent" "git" "sudo" "colored-man-pages" "extract" "command-not-found" ];
    };
  };  

  system.stateVersion = "25.05";
  system.autoUpgrade.enable = true;
  system.autoUpgrade.dates = "weekly";

  nix.gc.automatic = true;
  nix.gc.dates = "daily";
  nix.gc.options = "--delete-older-than 7d";
  nix.settings.auto-optimise-store = true;
}
