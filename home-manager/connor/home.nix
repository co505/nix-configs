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
      ll     = "ls -l";
      update = "sudo nixos-rebuild switch";
    };
    history.size = 10000;
  };

  
  programs.oh-my-posh = {
    enable = true; 
    useTheme = "emodipt-extend";
    enableZshIntegration = true;
  };


  #### Home Packages ####
  home.packages = [
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
