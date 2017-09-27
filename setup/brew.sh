#!/bin/bash
set -euo pipefail

# Get Homebrew-cask.
brew tap caskroom/cask

# Get the cask-upgrade command.
brew tap buo/cask-upgrade

# Install packages.
if ! brew update; then
  brew install \
    bash-completion \
    chromedriver \
    coreutils \
    docker-completion \
    editorconfig \
    geckodriver \
    git \
    git-extras \
    hub \
    jq \
    libffi \
    most \
    multitail \
    nodejs \
    openssl \
    p7zip \
    pandoc \
    python3 \
    ruby \
    shellcheck \
    tree \
    vagrant-completion \
    vim \
    wget \
    xz \
    Caskroom/cask/atom \
    Caskroom/cask/calibre \
    Caskroom/cask/docker \
    Caskroom/cask/etcher \
    Caskroom/cask/firefox \
    Caskroom/cask/flux \
    Caskroom/cask/google-chrome \
    Caskroom/cask/iterm2 \
    Caskroom/cask/java \
    Caskroom/cask/libreoffice \
    Caskroom/cask/ngrok \
    Caskroom/cask/spectacle \
    Caskroom/cask/sweet-home3d \
    Caskroom/cask/vagrant \
    Caskroom/cask/virtualbox \
    Caskroom/cask/virtualbox-extension-pack
    Caskroom/cask/vlc

  # Clean up.
  brew cleanup
  brew cask cleanup
fi
