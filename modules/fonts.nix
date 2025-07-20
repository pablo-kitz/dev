{ config, pkgs, ... }:
{
  fonts.fontconfig.enable = true;
  home.file.".local/share/fonts/JetBrainsMono-NF".source = ../fonts/JetBrainsMono-NF;
}
