{ config, pkgs, ... }:
{
  programs.zsh = {
    enable = true;
    oh-my-zsh = {
      enable = true;
      theme = "almamater";
      custom = ../dotfiles/.oh-my-zsh/custom;
    };
    plugins = [
      { name = "git"; }
      { name = "fzf"; }
      { name = "npm"; }
    ];
    shellAliases = { };
    initExtra = builtins.readFile ../dotfiles/.zshrc;
  };
}
