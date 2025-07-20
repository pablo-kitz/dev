{ config, pkgs, ... }:
{
  home.file.".git-templates/hooks/pre-commit".source = ../dotfiles/.git-templates/hooks/pre-commit;
}
