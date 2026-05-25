# mac-setup

This repo contains my macOS configuration managed with `nix-darwin`, `home-manager`, and `nix-homebrew`.

It currently defines:

1. macOS defaults such as Dock layout, Finder settings, screenshots location, and Touch ID for `sudo`
2. Homebrew-managed GUI apps such as Dropbox, Google Drive, VS Code, Spotify, Obsidian, and KeePassXC
3. Home Manager-managed user packages, shell configuration, Git settings, GPG agent configuration, Vim settings, and dotfiles such as `.tmux.conf` and `.autorestic.yaml`
4. A one-time activation step that symlinks `~/.ssh` to `~/Dropbox/Github/mac-setup/ssh` if `~/.ssh` does not already exist

## Bootstrap a new Mac

Install the Apple developer tools first:

```bash
xcode-select --install
```

Clone the repo into Dropbox so the SSH activation hook points at the expected location:

```bash
mkdir -p ~/Dropbox/Github
git clone https://github.com/daniel-wells/mac-setup.git ~/Dropbox/Github/mac-setup
cd ~/Dropbox/Github/mac-setup
```

Install Nix with Determinate Systems:

```bash
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
```

Load Nix into the current shell, then apply the configuration:

```bash
. /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh
nix run nix-darwin -- switch --flake .#Daniels-MacBook-Pro
```

After the first switch, subsequent updates are applied from the repo with:

```bash
darwin-rebuild switch --flake .#Daniels-MacBook-Pro
```
