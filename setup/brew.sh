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
    bower \
    brew-cask-completion \
    c-ares \
    chromedriver \
    coreutils \
    docker \
    docker-completion \
    docker-compose \
    docker-machine \
    e2fsprogs \
    editorconfig \
    ext2fuse \
    ext4fuse \
    freetype \
    gdbm \
    geckodriver \
    gettext \
    git \
    git-extras \
    glib \
    glide \
    gmp \
    gnutls \
    go \
    gradle \
    gradle-completion \
    htop \
    hub \
    hugo \
    icu4c \
    imagemagick \
    jenv \
    jpeg \
    jq \
    kubernetes-cli \
    kubernetes-helm \
    libffi \
    libgcrypt \
    libgpg-error \
    libidn2 \
    libmaxminddb \
    libpng \
    libtasn1 \
    libtiff \
    libtool \
    libunistring \
    libyaml \
    liquidprompt \
    little-cms2 \
    lua@5.1 \
    makedepend \
    md5sha1sum \
    most \
    multitail \
    netcat \
    nettle \
    node \
    node@8 \
    oniguruma \
    openjpeg \
    openssl \
    openssl@1.1 \
    p11-kit \
    p7zip \
    pandoc \
    pcre \
    pcre2 \
    perl \
    pip-completion \
    pkg-config \
    postgresql \
    python \
    python3 \
    python@2 \
    readline \
    redis \
    ruby \
    s-lang \
    shellcheck \
    sqlite \
    terraform \
    tree \
    vagrant-completion \
    vault \
    vim \
    webp \
    wget \
    wireshark \
    xz \
    yarn
  
  # Install cask formulas.
  brew cask install \
    atom \
    chromedriver \
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


