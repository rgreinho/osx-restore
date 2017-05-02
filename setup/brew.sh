#!/bin/bash
set -euo pipefail

# Install brew.
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Get Homebrew-cask.
brew tap caskroom/cask

# Install packages.
brew update
brew install \
  Caskroom/cask/android-sdk \
  Caskroom/cask/atom \
  Caskroom/cask/bash-completion \
  Caskroom/cask/calibre \
  Caskroom/cask/chromedriver \
  Caskroom/cask/coreutils \
  Caskroom/cask/docker \
  Caskroom/cask/docker-completion \
  Caskroom/cask/editorconfig \
  Caskroom/cask/etcher \
  Caskroom/cask/firefox \
  Caskroom/cask/flux \
  Caskroom/cask/geckodriver \
  Caskroom/cask/git \
  Caskroom/cask/git-extras \
  Caskroom/cask/git-review \
  Caskroom/cask/google-chrome \
  Caskroom/cask/hub \
  Caskroom/cask/iterm2 \
  Caskroom/cask/java \
  Caskroom/cask/jq \
  Caskroom/cask/libffi \
  Caskroom/cask/libreoffice \
  Caskroom/cask/most \
  Caskroom/cask/multitail \
  Caskroom/cask/ngrok \
  Caskroom/cask/nmap \
  Caskroom/cask/openssl \
  Caskroom/cask/p7zip \
  Caskroom/cask/pandoc \
  Caskroom/cask/pcre \
  Caskroom/cask/python3 \
  Caskroom/cask/ruby \
  Caskroom/cask/shellcheck \
  Caskroom/cask/spectacle \
  Caskroom/cask/sweet-home3d \
  Caskroom/cask/tree \
  Caskroom/cask/vagrant \
  Caskroom/cask/vagrant-completion \
  Caskroom/cask/vim \
  Caskroom/cask/virtualbox \
  Caskroom/cask/vlc
  Caskroom/cask/wget \
  Caskroom/cask/xz
