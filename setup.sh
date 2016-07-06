#!/bin/sh

scutil --get ComputerName # friendly version
scutil --get LocalHostName # no spaces etc.
scutil --get HostName

# sudo scutil --set ComputerName "dw-macbook"
# sudo scutil --set HostName "dw-macbook"
# sudo scutil --set LocalHostName "dw-macbook"

xcode-select --install

softwareupdate --install --all

sh install-software.sh

# after install dockutil
sh osxdefaults.sh

# install bash profile
ln -sfv "bash_profile.sh" ~/.bash_profile

# Install Sublime Text settings
cp -r Preferences.sublime-settings ~/Library/Application\ Support/Sublime\ Text*/Packages/User/Preferences.sublime-settings 2> /dev/null

# https://github.com/altercation/solarized/tree/master/iterm2-colors-solarized
# Install pretty iTerm colors
# open "itermcolors"

# Instead manually use plist settings in this directory

# Symlink ssh config
ln -s ~/Dropbox/configs/ssh-config.txt ~/.ssh/config

