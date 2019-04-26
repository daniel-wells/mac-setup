#!/bin/sh

# Remove huge useless programmes
# sudo rm -rf /Applications/iTunes.app/		# 300MB
# sudo rm -rf /Applications/iMovie.app/		# 2.95GB
# sudo rm -rf /Applications/iPhoto.app/		# 1.7GB
# sudo rm -rf /Applications/GarageBand.app/	# 1.16GB

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

brew install grep \
	rsync \
	wget \
	dockutil \
	git


brew tap caskroom/cask

brew cask install \
	textmate \
	iterm2 \
	r \
	cyberduck \
	github \
	rstudio \
	dropbox \
	box-drive \
	firefox \
	slack \
	prey \
	keepassxc \
	google-chrome \
	skype \
	lastfm \
	docker \
	igv \
	texstudio \
	tunnelbear \
	mactex \
	betterzipql \
	quicklook-csv \
	qlstephen
