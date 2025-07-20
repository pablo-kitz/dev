{ config, pkgs, ... }:
{
  programs.tmux = {
    enable = true;
    extraConfig = builtins.readFile ../dotfiles/.tmux.conf;
    plugins = [
      pkgs.tmuxPlugins.sensible
      pkgs.tmuxPlugins.yank
    ];
  };
}
