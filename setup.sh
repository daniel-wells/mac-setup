#!/bin/sh

scutil --get ComputerName # friendly version
scutil --get LocalHostName # no spaces etc.
scutil --get HostName

# sudo scutil --set ComputerName "Wells-MacBook-Pro"
# sudo scutil --set HostName "Wells-MacBook-Pro"
# sudo scutil --set LocalHostName "Wells-MacBook-Pro"

xcode-select --install

# Symlink bash profile
ln -sfv ~/Dropbox/Github/mac-setup/bash_profile.sh ~/.bash_profile

softwareupdate --install --all

sh install-software.sh

# after install dockutil
sh osxdefaults.sh

# Install Sublime Text settings
cp -r Preferences.sublime-settings ~/Library/Application\ Support/Sublime\ Text*/Packages/User/Preferences.sublime-settings 2> /dev/null

# https://github.com/altercation/solarized/tree/master/iterm2-colors-solarized
# Install pretty iTerm colors
# open "itermcolors"

# Instead manually use plist settings in this directory

# Symlink ssh config - not commited to public repo
ln -sfv ~/Dropbox/Github/mac-setup/ssh/ ~/.ssh

