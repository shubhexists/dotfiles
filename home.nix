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
  home.packages = with pkgs; [
    pkgs.git
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

  programs.git = {
    enable = true;
    userName = "shubhexists";
    userEmail = "shubh622005@gmail.com";
  };

  programs.home-manager.enable = true;
}
