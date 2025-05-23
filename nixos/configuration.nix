{ config, pkgs, ... }:

let
  unstable = import <nixos-unstable> {
    config = {
      allowUnfree = true;
    };
  };
in
{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
  ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  
  # ENV Variables
  environment.variables = {
    NIX_BUILD_SHELL = "zsh";
  };
  
  #############################
  ########## Network ##########
  networking.hostName = "tilab"; 
  networking.networkmanager.enable = true;
  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  ############################
  ########## Locale ##########
  time.timeZone = "America/Mexico_City";
  i18n.defaultLocale = "en_US.UTF-8";
  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "es";
    variant = "";
  };
  # Configure console keymap
  console.keyMap = "es";

  ####################################
  ########## NixOS Features ##########
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  # Eperimental features
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  
  ###########################################
  ########## Pipewire Audio config ##########
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

  ###########################
  ########## Fonts ##########
  fonts.packages = with pkgs; [ nerdfonts ];

  ##########################
  ########## User ##########
  users.users.marcos = {
    shell = pkgs.zsh;
    isNormalUser = true;
    description = "Marcos";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    packages = with pkgs; [
      stremio
      nicotine-plus
      spotify
      obs-studio
      chromium
      google-chrome
      brave
      insomnia
      zoom-us
      teamviewer
      audacity
      slack
      discord
      rnote
      copyq
      unstable.megasync
      unstable.calibre
      unstable.flameshot
      unstable.anki
      unstable.gitkraken
      unstable.drawio
      unstable.ferdium
      unstable.ollama
      unstable.code-cursor
      unstable.bitwarden-desktop
    ];
  };
  
  ##########################
  ########## ZSH  ##########
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
    shellAliases = {
      l = "eza --long --grid";
      la = "eza --long --grid --all";
      lt = "eza --long --tree";
      ld = "eza --long --grid --only-dirs";
      li = "eza --long --grid --only-files";
      lg = "eza --long --grid --git";
      neo = "neofetch";
      nerd = "nerdfetch";
      j = "jump";
      e = "exit";
      c = "clear";
      v = "nvim .";
      # NixOS
      ndev = "nix develop -c $SHELL";
      nconfig = "cd ~/dots/ && nix-shell --run zsh";
      nbuild = "sudo nixos-rebuild switch";
      nupdate = "sudo nixos-rebuild switch --upgrade";
      nclean = "nh clean all";
      nshell = "nix-shell --run zsh";
      nsearch = "nix-env -qP --available";
      # TMUX
      tls = "tmux ls";
      tns = "tmux new -s";
      tas = "tmux attach -t";
      tks = "tmux kill-session -t";
      tkill = "tmux kill-server";
      # Hyprland
      logout = "hyprctl dispatch exit";
      # Waybar
      wrestart = "killall waybar; waybar & disown";
    };
    ohMyZsh = {
      enable = true;
      plugins = [
        "git"
        "git-flow"
        "jump"
      ];
    };
  };
  
  #####################################
  ########## System packages ##########
  environment.systemPackages = with pkgs; [
    home-manager
    brightnessctl
    pavucontrol
    easyeffects
    neofetch
    nerdfetch
    ghostty
    fzf
    tmux
    zsh
    starship
    gnupg
    git
    gitflow
    gcc
    unzip
    zig
    eza
    vscode
    hyprland
    hyprpaper
    hyprwall
    hyprshot
    hyprlock
    hypridle
    hyprpicker
    wofi
    htop
    swaynotificationcenter
    scrcpy
    networkmanager
  ];

  ##############################
  ########## Programs ##########
  # Hyprland
  programs.hyprland.enable = true; # enable Hyprland
  # Optional, hint Electron apps to use Wayland:
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  # Waybar
  programs.waybar.enable = true;
  # GSConnect
  programs.kdeconnect = {
    enable = true;
    package = pkgs.gnomeExtensions.gsconnect;
  };
  # Install firefox.
  programs.firefox.enable = true;
  # Yet Another Nix Helper
  programs.nh = {
    enable = true;
    clean.enable = true;
  };
  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };
  # Not compatible with NixOS
  programs.nix-ld.libraries = with pkgs; [
    # unstable.stylua
  ];
  
  ##############################
  ########## Services ##########
  # Enable the OpenSSH daemon.
  services.openssh.enable = true;
  # Enable the X11 windowing system.
  services.xserver.enable = true;
  # Enable automatic login for the user.
  services.displayManager.autoLogin.enable = true;
  services.displayManager.autoLogin.user = "marcos";
  # GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;
  # GNOME autologin: https://github.com/NixOS/nixpkgs/issues/103746#issuecomment-945091229
  systemd.services."getty@tty1".enable = false;
  systemd.services."autovt@tty1".enable = false;
  # Teamviewer
  services.teamviewer.enable = true;
  # Enable CUPS to print documents.
  services.printing.enable = true;
  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;


  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?
}
