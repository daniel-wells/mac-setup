# mac-setup
These are my ['dotfiles'](https://dotfiles.github.io) which specify the custom configurations of my mac (system prefereces, installed software, software preferences). There is also a 'bootstrap' script which will automatically configure these settings when setting up a new mac.

[setup.sh](setup.sh) is the bootstrap script and it will do the following:

1. Install xcode (select)
2. Run [brew.sh](brew.sh) which installs all the utilities and programmes I use
3. Run [osx-defaults.sh](osx-defaults.sh) which configures system preferences such as dock location
4. Install [bash_profile.sh](bash_profile.sh) as my terminal bash settings
5. Setup my ssh/config (file not in this repo for security)

The iTerm2 configuration file must be loaded manually in iTerm > Preferences > Load preferences from a custom folder or URL

To install:
```bash
cd ~ ; mkdir -p mac-setup
curl -#L https://github.com/daniel-wells/mac-setup/tarball/master | tar -xzv --strip-components 1 -C mac-setup
sh mac-setup/setup.sh
```