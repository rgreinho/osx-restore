#!/bin/bash
set -euo pipefail

# Define variables.
: ${OSXR_BREW_FORCE_INSTALL:=0}

# Get Homebrew-cask.
brew tap caskroom/cask

# Get the cask-upgrade command.
brew tap buo/cask-upgrade

# Install packages.
if ! brew update || [ "${OSXR_BREW_FORCE_INSTALL}" -eq 1 ] ;then
  brew install \
    bash-completion \
    brew-cask-completion \
    chromedriver \
    coreutils \
    docker-completion \
    editorconfig \
    geckodriver \
    git \
    git-extras \
    glide \
    go \
    htop \
    hub \
    imagemagick \
    jq \
    libffi \
    liquidprompt \
    most \
    multitail \
    node@8 \
    openssl \
    p7zip \
    pandoc \
    pip-completion \
    python3 \
    ruby \
    shellcheck \
    tree \
    vagrant-completion \
    vim \
    wget \
    xz \
    yarn
  
  # Install cask formulas.
  brew cask install \
    atom \
    docker \
    etcher \
    firefox \
    flux \
    google-chrome \
    iterm2 \
    java \
    libreoffice \
    ngrok \
    spectacle \
    slack \
    sweet-home3d \
    vagrant \
    virtualbox \
    virtualbox-extension-pack \
    vlc

  # Clean up.
  brew cleanup
  brew cask cleanup
fi
