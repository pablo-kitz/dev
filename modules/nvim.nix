{ config, pkgs, ... }:
{
  programs.neovim = {
    enable = true;
    extraConfig = builtins.readFile ../dotfiles/.config/nvim/lua/config/options.lua;
    # You can add more Lua config or plugins here
  };
}
