# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  #### Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

 
  #### Time zone and internationalisation properties ####
  
  time.timeZone = "Europe/London";
  i18n.defaultLocale = "en_US.UTF-8";
  

  #### Console settings ####

  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  #   useXkbConfig = true; # use xkb.options in tty.
  # };


  #### Networking settings ####

  networking.hostName = "nixos"; # Define your hostname.
  
  # Pick only one of the below networking options.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

 

  #### Programs & Services enabled ####
  
  programs.zsh.enable = true;
  programs.firefox.enable = true;
  
  services.xserver.enable = true;
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  programs.steam.enable = true;
  programs.steam.gamescopeSession.enable = true;
  programs.gamemode.enable = true;


  
  #### Audio settings ####
  services.pipewire = {
     enable = true;
     pulse.enable = true;
   };

  
  #### Users

  #  TODO: Setup different users for each device. 
  
  users.users.connor = {
    isNormalUser = true;
    shell = pkgs.zsh;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
    packages = with pkgs; [
      tree
    ];
  };


  #### Global packages installed ####

  #  TODO: Decide which applications are user specific
  
  environment.systemPackages = with pkgs; [
     vim # Do not forget to add a
     wget
     neovim
     zsh
     git
     fastfetch
     mullvad
     vagrant
     virtualbox
     uv
     python312Full
     zellij
     oh-my-zsh
     oh-my-posh
     eza
     ansible
     btop
     steam
     spotify
     slack
     wine-staging
     ghostty
     librewolf
     gparted
     isoimagewriter
     discord
     atuin
     alacritty
     jetbrains.jdk
     kate
     mariadb
     protonup
     lutris
     home-manager
     zsh-syntax-highlighting
     zsh-autosuggestions
     gcc
     nil
     cargo
  ];

  #### GPU (Nvidia) & Gaming related settings ####
 
  # TODO: Only apply these to connor, other users shouldn't benefit from these. 

  services.xserver.videoDrivers = ["nvidia"];
  
  environment.sessionVariables = {
    STEAM_EXTRA_TOOLS_PATHS =
      "$HOME/.steam/root/compatibilitytools.d";
  };

  hardware.nvidia = {

    # Modesetting is required.
    modesetting.enable = true;

    # Nvidia power management. Experimental, and can cause sleep/suspend to fail.
    # Enable this if you have graphical corruption issues or application crashes after waking
    # up from sleep. This fixes it by saving the entire VRAM memory to /tmp/ instead 
    # of just the bare essentials.
    powerManagement.enable = false;

    # Fine-grained power management. Turns off GPU when not in use.
    powerManagement.finegrained = false;

    # Use the Nvidia open source kernel module
    open = false;

    # Enable the Nvidia settings menu,
    nvidiaSettings = true;

    # Optionally, you may need to select the appropriate driver version for your specific GPU.   package = config.boot.kernelPackages.nvidiaPackages.stable;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  }:
  
  ## Enable OpenGL and NVIDIA service
  hardware.graphics = {
    enable = true;
  
  };


  system.stateVersion = "24.11"; # Did you read the comment?

  
  #### Features to use later ####

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  ## Touchpad Support for Laptop 
  # services.libinput.enable = true;
  
  ## Enable SSH client
  # services.openssh.enable = true;
  
  ## Firewall 

  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # networking.firewall.enable = false;
  
  ## Copy system configuration 

  # system.copySystemConfiguration = true;
}

