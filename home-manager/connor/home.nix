{ config, pkgs, ... }:

{
  #### !! Draft (but working) file, lots to tinker with !! ####

  home.username = "connor";
  home.homeDirectory = "/home/connor";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;


  #### ZSH setup #### 

  #  TODO: Need to review this... changes could be global, redundant options may lurk here too. 

  programs.zsh = {
    enable             = true;
    enableCompletion  = true;               
    autosuggestion.enable     = true;       
    syntaxHighlighting.enable  = true;       
    
    shellAliases = {
      ls     = "eza -l";
      update = "sudo nixos-rebuild switch";
      v = "nvim";
      edit_config = "nvim /etc/nixos/configuration.nix";
      edit_hardware = "sudo nvim /etc/nixos/hardware-configuration.nix";
      cp_config_git = "cp -f /etc/nixos/configuration.nix ~/Git/nix-configs/configuration.nix";
      cp_config_home = "cp -f ~/.config/home-manager/home.nix ~/Git/nix-configs/home-manager/connor/home.nix";
    };

    history.size = 10000;
  
  };
 
  programs.oh-my-posh = {
    enable = true; 
    useTheme = "emodipt-extend";
    enableZshIntegration = true;
  };
 
  programs.ghostty.settings = {
    theme = "Kanagawa Dragon";
  };
  
  nixpkgs.config.allowUnfree = true;

  #### Home Packages ####
  
  home.packages = [
    pkgs.steam
    pkgs.wine-staging
    pkgs.librewolf
    pkgs.discord   
    pkgs.jetbrains.jdk
    pkgs.kate
    pkgs.lutris
    pkgs.protonplus
    pkgs.mullvad
    pkgs.spotify
    pkgs.slack
    pkgs.protonup
    pkgs.oxygen
    pkgs.chromium
    pkgs.jetbrains.pycharm-professional
    pkgs.globalprotect-openconnect
  ];



  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
 };

 home.sessionVariables = {
    # EDITOR = "emacs";
  };
 
  home.stateVersion = "24.05"; # Please read the comment before changing.
  
}
