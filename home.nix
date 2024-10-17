{ config, pkgs, ... }:


let
  myAliases = {
      ll = "ls -l";
    };
  in 
  {
  home.username = "jerry";
  home.homeDirectory = "/home/jerry";
  home.stateVersion = "24.05"; 
  home.packages = [
  ];

  home.file = {
  };
  
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  programs.bash = {
    enable = true;
    shellAliases = myAliases;
  };
  
  programs.zsh = {
    enable = true;
    shellAliases = myAliases;
  };

  programs.home-manager.enable = true;
}
