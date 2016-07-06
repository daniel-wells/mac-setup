#!/bin/sh

# Remove huge useless programmes
sudo rm -rf /Applications/iTunes.app/		# 300MB
sudo rm -rf /Applications/iMovie.app/		# 2.95GB
sudo rm -rf /Applications/iPhoto.app/		# 1.7GB
sudo rm -rf /Applications/GarageBand.app/	# 1.16GB

# Install Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# move local/bin before /bin
echo 'export PATH="/usr/local/bin:$PATH"' >> ~/.bash_profile

sudo chown -R danielwells /usr/local

brew doctor
# brew update # update homebrew itself
# brew outdated # view outdated packages
# brew upgrade # update outdated packages
# brew cleanup # brew keeps all old versions

brew tap homebrew/dupes
brew install grep \
	graphviz \
	rsync \
	wget \
	dockutil \
	git

brew install --with-x11 --with-openblas homebrew/science/r
# alternatively 'brew cask install r'

# install.packages(c("ggplot2","devtools","data.table","ggrepel","ggTimeSeries","httr","lubridate","RColorBrewer","scales"))

brew tap caskroom/cask

brew cask install \
	textmate \
	iterm2 \
	spotify \
	spectacle \
	cyberduck \
	github-desktop \
	rstudio \
	evernote \
	megasync \
	dropbox \
	gopro \
	gopro-studio \
	skype \
	tunnelblick \
	firefox \
	google-chrome \
	vlc \
	keybase \
	prey \
	virtualbox \
	sublime-text

brew cask install betterzipql #peak inside zips
brew cask install quicklook-csv #tsv files
brew cask install qlstephen #look at files without extensions

# Other Applications
# KeyPassX
# Snapgene
# MacPyMolEdu
# GIMP
