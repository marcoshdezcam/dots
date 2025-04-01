# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "tilab"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/Mexico_City";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  # Hyprland
  programs.hyprland.enable = true; # enable Hyprland
  # Optional, hint Electron apps to use Wayland:
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  # Waybar
  programs.waybar.enable = true;

  services.teamviewer.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "es";
    variant = "";
  };

  # Configure console keymap
  console.keyMap = "es";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;
    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Nerd Fonts
  fonts.packages = with pkgs; [ nerdfonts ];

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.marcos = {
    shell = pkgs.zsh;
    isNormalUser = true;
    description = "Marcos";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
        pkgs.stremio
        pkgs.nicotine-plus
        pkgs.gitkraken
        pkgs.spotify
        pkgs.obs-studio
        pkgs.chromium
        pkgs.insomnia
        pkgs.brave
        pkgs.zoom-us
        pkgs.teamviewer
        pkgs.audacity
        pkgs.ferdium
    ];
  };

  # Enable automatic login for the user.
  services.displayManager.autoLogin.enable = true;
  services.displayManager.autoLogin.user = "marcos";

  # Workaround for GNOME autologin: https://github.com/NixOS/nixpkgs/issues/103746#issuecomment-945091229
  systemd.services."getty@tty1".enable = false;
  systemd.services."autovt@tty1".enable = false;

# Install firefox.
  programs.firefox.enable = true;
  # Neovim as default editor
  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # ZSH Shell
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
    shellAliases = {
      l="eza --long --grid";
      la="eza --long --grid --all";
      lt="eza --long --tree";
      ld="eza --long --grid --only-dirs";
      lf="eza --long --grid --only-files";
      lg="eza --long --grid --git";
      neo="neofetch";
      nerd="nerdfetch";
      rebuild="sudo nixos-rebuild switch";
      update="sudo nixos-rebuild switch --upgrade";
      clean="sudo nix-collect-garbage";
      j = "jump";
      e = "exit";
      c = "clear";
      v = "nvim";
      tls="tmux ls";
      tns="tmux new -s";
      tas="tmux attach -t";
      tks="tmux kill-session -t";
      tkill="tmux kill-server";
    };
    ohMyZsh = {
      enable = true;
      plugins = [ "git" "git-flow" "jump" ];
    };
  };

  # System wide packages
  environment.systemPackages = with pkgs; [
    pkgs.neofetch
    pkgs.nerdfetch
	  pkgs.ghostty
	  pkgs.kitty
    pkgs.neovim
    pkgs.fzf
    pkgs.tmux
    pkgs.zsh
    pkgs.starship
    pkgs.gnupg
    pkgs.git
    pkgs.gitflow
    pkgs.gcc
    pkgs.unzip
    pkgs.zig
    pkgs.eza
    pkgs.vscode
    pkgs.hyprland
    pkgs.hyprpaper
    pkgs.hyprwall
    pkgs.hyprshot
    pkgs.hyprlock
    pkgs.hypridle
    pkgs.wofi
    pkgs.ripgrep
    pkgs.htop
    pkgs.brightnessctl
    pkgs.swaynotificationcenter
    pkgs.pavucontrol
    pkgs.easyeffects
    pkgs.scrcpy
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # Services
  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?
}
