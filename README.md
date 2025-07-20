# Pablo Kitzberger's Nix/Flake Dev Environment

## Structure

- `flake.nix`: Entry point for the Nix flake, sets up Home Manager and imports your config.
- `home.nix`: Main Home Manager config. Imports all modules, sets packages, dconf, and state version.
- `modules/`: Modular configs for each tool (zsh, tmux, git, nvim, alacritty, fonts, git-templates).
- `dotfiles/`: Your original dotfiles, now managed by Nix.
- `fonts/`: JetBrainsMono Nerd Font (place font files here if not managed by Nix).

## Usage

### 1. Install Nix (if not already installed)
```sh
sh <(curl -L https://nixos.org/nix/install) --daemon
```

### 2. Enable Flakes
Add this to `~/.config/nix/nix.conf`:
```
experimental-features = nix-command flakes
```

### 3. Build and Test (non-destructive)
```sh
nix build .#homeConfigurations.pablo.activationPackage
```

### 4. See what would change (dry-run)
```sh
nix run .#homeConfigurations.pablo.activationPackage -- dry-activate
```

### 5. Activate (apply) the environment
```sh
nix run .#homeConfigurations.pablo.activationPackage -- switch
```

## Extending/Modifying
- **Add/Remove Packages:** Edit `home.packages` in `home.nix`.
- **Add/Remove Modules:** Edit the `imports` list in `home.nix`.
- **Edit Tool Configs:** Edit the corresponding file in `modules/`.
- **Add GNOME/desktop settings:** Extend the `dconf.settings` attribute in `home.nix`.

## Notes
- Fonts: Place JetBrainsMono Nerd Font files in `fonts/JetBrainsMono-NF` if not managed by Nix.
- Some settings (like `gh auth login`) require manual steps for secrets.
- For Docker, enable via your system config if needed (not user-level).

---

**Test with `nix build` and `dry-activate` before switching!**

---

For more info, see the [Home Manager manual](https://nix-community.github.io/home-manager/) and [NixOS Flakes documentation](https://nixos.wiki/wiki/Flakes).
