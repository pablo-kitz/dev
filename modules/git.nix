{ config, pkgs, ... }:
{
  programs.git = {
    enable = true;
    userName = "Pablo Kitzberger";
    userEmail = "kitzberger.pablo@gmail.com";
    extraConfig = {
      credential = {
        "https://github.com".helper = "!/usr/bin/gh auth git-credential";
        "https://gist.github.com".helper = "!/usr/bin/gh auth git-credential";
        "https://dev.azure.com/gz" = {
          helper = "manager";
          credentialStore = "secretservice";
          useHttpPath = true;
        };
      };
      init = {
        defaultBranch = "main";
        templateDir = "~/.git-templates";
      };
      push.autoSetupRemote = true;
    };
  };
}
