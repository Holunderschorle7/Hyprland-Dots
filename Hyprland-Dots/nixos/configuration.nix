{ config, pkgs, ... }:
{
  imports =
    [ 
      ./hardware-configuration.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; 

  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Berlin";

  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "de_DE.UTF-8";
    LC_IDENTIFICATION = "de_DE.UTF-8";
    LC_MEASUREMENT = "de_DE.UTF-8";
    LC_MONETARY = "de_DE.UTF-8";
    LC_NAME = "de_DE.UTF-8";
    LC_NUMERIC = "de_DE.UTF-8";
    LC_PAPER = "de_DE.UTF-8";
    LC_TELEPHONE = "de_DE.UTF-8";
    LC_TIME = "de_DE.UTF-8";
  };

  services.xserver.xkb = {
    layout = "de";
    variant = "";
  };

  console.keyMap = "de";

  users.users.maxi = {
    isNormalUser = true;
    description = "maxi";
    extraGroups = [ "networkmanager" "wheel" ];
  };


  hardware.nvidia = {
    modesetting.enable = true;
    open = false;
  };
  services.xserver.videoDrivers = [ "nvidia" ];
  services.flatpak.enable = true;

  programs.gamescope.enable = true; 

  programs.gamemode.enable = true;
  programs.steam.enable = true;
  programs.hyprland.enable = true;  
  
  nixpkgs.config = {
    allowUnfree = true;
    supportedSystems = [ "x86_64-linux" "i686-linux" ];
  };

hardware.graphics = {
  enable = true;
  extraPackages32 = with pkgs; [
    swaybg
    waypaper
    glibc
    xorg.libX11
    freetype
    alsa-lib
    zlib
    gcc
  ];
};

environment.systemPackages = with pkgs; [
  vscode
  neofetch
  spicetify-cli
  vesktop
  swww
  rofi
  waypaper
  swaybg
  glibc
  xorg.libX11
  freetype
  alsa-lib
  zlib
  gcc
  peaclock
  vulkan-tools
  egl-wayland
  spotify
  discord
  adwaita-icon-theme
  xcursor-themes
  alacritty
  blueberry
  btop
  cava
  fastfetch
  ffmpeg
  firefox
  grim
  hypridle
  hyprland
  hyprpaper
  hyprlock
  lazygit
  libqalculate
  mako
  mpvpaper
  nautilus
  neovim
  pywal
  slurp
  starship
  swaybg
  unimatrix
  walker
  waybar
  git
];

  system.stateVersion = "25.11"; 

}
