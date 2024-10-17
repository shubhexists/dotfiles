{ config, pkgs, ... }:
{
  programs.neovim = {
    enable = true;
    
    plugins = with pkgs.vimPlugins; [
      lazy-nvim
    ];

    extraPackages = with pkgs; [
      gcc
      git
      nodejs
      ripgrep
      fd
      tree-sitter
    ];

    extraLuaConfig = ''
      -- Bootstrap lazy.nvim
      local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
      if not vim.loop.fs_stat(lazypath) then
        vim.fn.system({
          "git",
          "clone",
          "--filter=blob:none",
          "https://github.com/folke/lazy.nvim.git",
          "--branch=stable",
          lazypath,
        })
      end
      vim.opt.rtp:prepend(lazypath)

      -- Set leader key before lazy setup
      vim.g.mapleader = " "
      vim.g.maplocalleader = " "

      -- Load all configuration files
      require("options")
      require("plugins")
      require("keymaps")
    '';
  };
}