{ config, pkgs, ... }:
{
  xdg.configFile."alacritty/alacritty.toml".source = ../dotfiles/.config/alacritty/alacritty.toml;
  home.file.".config/alacritty/tmux-session-launch.sh".source = ../dotfiles/.config/alacritty/tmux-session-launch.sh;
}
