{
  description = "Example nix-darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:nix-darwin/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    nix-homebrew.url = "github:zhaofengli/nix-homebrew";

    # Optional: Declarative tap management
    homebrew-core = {
      url = "github:homebrew/homebrew-core";
      flake = false;
    };
    homebrew-cask = {
      url = "github:homebrew/homebrew-cask";
      flake = false;
    };
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, home-manager, nix-homebrew, homebrew-core, homebrew-cask}:
  let
    user = "d.wells";
    configuration = { pkgs, ... }: {
	users.users."${user}" = {
      name = "${user}";
      home = "/Users/${user}";
	    };
      # List packages installed in system profile. To search by name, run:
      # $ nix-env -qaP | grep wget
      environment.systemPackages =
        [ pkgs.vim
        ];

      # Necessary for using flakes on this system.
      nix.settings.experimental-features = "nix-command flakes";

      # avoid conflict with nix determinate
      nix.enable = false;

      system.primaryUser = "${user}";
      system.defaults = {
          NSGlobalDomain.NSAutomaticQuoteSubstitutionEnabled = false;
          NSGlobalDomain.NSAutomaticDashSubstitutionEnabled = false;
          ".GlobalPreferences"."com.apple.mouse.scaling" = 3.0;
          finder.AppleShowAllExtensions = true;
          finder.ShowPathbar = true;
          screencapture.location = "~/Google_Drive/Screenshots";
      };

    system.defaults.dock = {
    # Automatically hide and show the Dock
	    autohide = true;
	    orientation = "left";
    
	    # Standard app icons size (in pixels)
	    tilesize = 48;

	    # Specify which apps to keep in the Dock
	    persistent-apps = [
	      "/Applications/Safari.app"
	      "/System/Applications/Utilities/Activity Monitor.app"
	      "/System/Applications/System Settings.app"
	      "/Applications/TextMate.app"
	      "/Applications/Spotify.app"
	      "/Applications/Obsidian.app"
	      "/Applications/KeePassXC.app"
	      "/Applications/Visual Studio Code.app"
	      "/System/Applications/TV.app"
    ];
  };

      security.pam.services.sudo_local.touchIdAuth = true;

      # Set Git commit hash for darwin-version.
      system.configurationRevision = self.rev or self.dirtyRev or null;

      # Used for backwards compatibility, please read the changelog before changing.
      # $ darwin-rebuild changelog
      system.stateVersion = 6;

      # The platform the configuration will be used on.
      nixpkgs.hostPlatform = "aarch64-darwin";
    };

   homebrewConfig = {
      nix-homebrew = {
        # Enable nix-homebrew
        enable = true;

        # Apple Silicon / M-series Mac architecture
        enableRosetta = false;

        # User owning the Homebrew prefix
        user = "${user}";

        # Automatically migrate existing Homebrew installations
        autoMigrate = true;
      };

      # Standard nix-darwin Homebrew configuration for installing apps
      homebrew = {
        enable = true;
        
        # Automatically updates Homebrew and taps on darwin-rebuild
        onActivation.autoUpdate = true;
        onActivation.upgrade = true;

        # Add your Homebrew casks, Mac App Store apps, or formulae here
        casks = [
         "spotify" 
         "visual-studio-code"
         "dropbox"
         "google-drive"
         "keepassxc"
         "obsidian"
         "signal"
         "whatsapp"
         "textmate"
        ];
        brews = [];
        masApps = {};
      };
    };

  homemanagerConfig = {
          # Automatically use the global pkgs set configured by nix-darwin
          home-manager.useGlobalPkgs = true;
          # Installs packages to /etc/profiles/per-user instead of ~/.nix-profile
          home-manager.useUserPackages = true;
          
          # 3. Define your user configurations
          home-manager.users."${user}" = import ./home.nix;
          
          # Optional: Pass flake inputs into home.nix if needed
          # home-manager.extraSpecialArgs = { inherit inputs; };
    };

  in
  {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#Daniels-MacBook-Pro
    darwinConfigurations."Daniels-MacBook-Pro" = nix-darwin.lib.darwinSystem {
      modules = [
          configuration
          nix-homebrew.darwinModules.nix-homebrew
          homebrewConfig
	  home-manager.darwinModules.home-manager
          homemanagerConfig
          ];
    };
  };
}
