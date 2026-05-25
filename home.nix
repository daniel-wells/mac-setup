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
    fd
    fzf
    wget
    git
    htop
    tmux
    restic
    autorestic
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
    ".fdignore".text = ''
      Library/Caches
      Library/Logs
      Library/Developer
      Library/Application Support
      Library/Containers
      Library/Mail
    '';

    ".autorestic.yaml".source = ./autorestic.yaml;
  };

  home.sessionVariables = {
    FZF_DEFAULT_COMMAND = "fd . --follow $HOME";
    FZF_CTRL_T_COMMAND = "$FZF_DEFAULT_COMMAND";
    HISTSIZE = "32768";
    HISTFILESIZE = "$HISTSIZE";
    HISTCONTROL = "ignoreboth";
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

  services.gpg-agent = {
    enable = true;
    pinentry.package = pkgs.pinentry_mac; 
    defaultCacheTtl = 28800;
    maxCacheTtl = 86400;
  };

  programs.gpg = {
    enable = true;
  };

  programs.zsh = {
    enable = true;
    shellAliases = {
      ls = "ls -GFh";
      grep = "grep --color=auto";
      mergepdf = "/System/Library/Automator/Combine\\ PDF\\ Pages.action/Contents/Resources/join.py";
    };
    initContent = ''
      export GPG_TTY=$(tty)
    '';
  };

  #home.file."gnupg/gpg-agent.conf".text = ''
    #pinentry-program ${pkgs.pinentry_mac}/bin/pinentry-mac
   # '';

 programs.vim = {
  enable = true;
  extraConfig = ''
    set diffopt+=internal,algorithm:patience
    set backspace=indent,eol,start
    set relativenumber
    syntax on

    set cursorline
    set showmatch
    set incsearch
    set hlsearch
    inoremap jk <esc>`^
    inoremap kj <esc>`^

    set ruler
    set tabstop=4
    set softtabstop=4
    set shiftwidth=4
    set expandtab
    set list
    set autoindent
    set smartindent
  '';
};

}
