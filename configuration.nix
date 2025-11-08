{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "work-outeiroDev";
  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Madrid";
  i18n.defaultLocale = "es_ES.UTF-8";

  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  environment.systemPackages = with pkgs; [ niri ];
  services.displayManager.sessionPackages = with pkgs; [ niri ];

  services.xserver.xkb = {
    layout = "us";
  };

  services.printing.enable = true;

  services.pulseaudio.enable = false;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  security.rtkit.enable = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  users.users.joel = {
    isNormalUser = true;
    extraGroups = [ "networkmanager" "wheel" "root" ];
    shell = pkgs.zsh;
  };
  
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;
    autosuggestions.enable = true;

    ohMyZsh = {
      enable = true;
      theme = "powerlevel10k/powerlevel10k";
      customPkgs = [ pkgs.zsh-powerlevel10k ];
      plugins = [
        "you-should-use"
        "docker"
        "aliases"
        "zoxide"
        "eza"
        "fzf"
        "gh"
        "github"
        "fnm"
        "ssh-agent"
        "git"
        "caniuse"
        "zsh-autosuggestions"
        "zsh-syntax-highlighting"
        "zsh-completions"
        "z"
        "sudo"
        "colored-man-pages"
        "extract"
        "command-not-found"
      ];
    };
  };
  users.defaultUserShell = pkgs.zsh;

  programs.niri.enable = true;

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  services.openssh.enable = true;

  system.stateVersion = "25.05";
}
