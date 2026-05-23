{ config, pkgs, ... }:

{
  # Ensure this matches your macOS username
  home.username = "d.wells";
  home.homeDirectory = "/Users/d.wells";

  # This value determines the Home Manager release that your configuration is
  # compatible with. It helps avoid breakage when a new Home Manager release
  # introduces backwards-incompatible changes.
  home.stateVersion = "26.05"; # Use the current stable or matching version

  # Packages you want to install specifically for your user
  home.packages = with pkgs; [
    ripgrep
    htop
    tmux
    restic
    gnupg
    pinentry_mac
  ];

  # Managing files directly (dotfiles)
  home.file = {
    # Example: creates a ~/.config/git/config file directly
    # ".config/git/config".text = ''
    #   [user]
    #     name = My Name
    #     email = myemail@example.com
    # '';
  };

  # Let Home Manager manage itself and specific software environments
  programs.home-manager.enable = true;

  programs.git = {
    enable = true;
    settings.user.name = "Daniel Wells";
    settings.user.email = "daniel-wells@users.noreply.github.com";

    signing = {
        key = "E3CE2D4384E61B5F";
        signByDefault = true;
     };
  };

  programs.gpg = {
    enable = true;
  };

  home.file."gnupg/gpg-agent.conf".text = ''
    pinentry-program ${pkgs.pinentry_mac}/bin/pinentry-mac
    default-cache-ttl 60000
    max-cache-ttl 72000
    '';

  programs.zsh.initExtra = ''
    export GPG_TTY=$(tty)
 '';

}
