{ config, pkgs, ... }:
{
  home.username = "pablokitz";
  home.homeDirectory = "/home/pablokitz";

  # Basic packages
  home.packages = with pkgs; [
    git
    fzf
    tmux
    neovim
    zsh
    unzip
    wget
    curl
    xclip
    flameshot
    gh
    gnome3.gnome-keyring
    jq
    stow
    ffmpeg
    tree
    htop
    fd
    ripgrep
    bat
    go
    sqlite
    alacritty
    vscode
    bitwarden
    nodejs
    nodePackages.npm
    # Add more as needed
  ] ++ (with pkgs.nodePackages; [
    eslint
    typescript
    prettier
  ]);

  # GNOME/Flameshot/Window nav dconf settings
  dconf.settings = {
    "org/gnome/shell/keybindings".show-screenshot-ui = [];
    "org/gnome/settings-daemon/plugins/media-keys".custom-keybindings = [
      "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"
    ];
    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/" = {
      name = "Flameshot GUI";
      command = "flameshot gui";
      binding = "Print";
    };
    "org/gnome/shell/extensions/just-perfection".workspace-popup = false;
    "org/gnome/shell/extensions/just-perfection".animation = 0;
    "org/gnome/desktop/interface".enable-animations = false;
    "org/gnome/mutter".dynamic-workspaces = false;
    "org/gnome/desktop/wm/preferences".num-workspaces = 5;
    "org/gnome/desktop/wm/keybindings" = {
      "switch-to-workspace-1" = ["<Alt>1"];
      "switch-to-workspace-2" = ["<Alt>2"];
      "switch-to-workspace-3" = ["<Alt>3"];
      "switch-to-workspace-4" = ["<Alt>4"];
      "switch-to-workspace-5" = ["<Alt>5"];
    };
  };

  # State version
  home.stateVersion = "24.05";
}
