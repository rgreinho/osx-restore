#!/bin/bash
set -euo pipefail

# Define variables.
: ${OSXR_BREW_FORCE_INSTALL:=0}

# Get Homebrew-cask.
#brew tap homebrew/cask-cask

# Get the cask-upgrade command.
brew tap buo/cask-upgrade

# Install packages.
#brew install osxfuse
brew cask install homebrew/cask-versions/adoptopenjdk8
if ! brew update || [ "${OSXR_BREW_FORCE_INSTALL}" -eq 1 ] ;then
  brew install \
    aom
    autoconf
    automake
    awscli
    bash-completion
    bat
    bdw-gc
    berkeley-db
    bower
    brew-cask-completion
    brotli
    c-ares
    cairo
    chromedriver
    coreutils
    dav1d
    dep
    docbook
    docbook-xsl
    docker
    docker-completion
    docker-compose
    docker-machine
    e2fsprogs
    editorconfig
    exercism
    ext2fuse
    ext4fuse
    fd
    fetch
    ffmpeg
    flac
    fontconfig
    freetds
    freetype
    frei0r
    fribidi
    gd
    gdbm
    gdk-pixbuf
    geckodriver
    gettext
    ghostscript
    giflib
    git
    git-extras
    git-gui
    gitui
    glib
    glide
    glooctl
    gmp
    gnu-getopt
    gnupg
    gnutls
    go
    go-task
    gobject-introspection
    golangci-lint
    gometalinter
    gradle
    gradle-completion
    graphite2
    graphviz
    gts
    guile
    harfbuzz
    helm
    helmfile
    heroku
    heroku-node
    htop
    hub
    hugo
    icu4c
    ilmbase
    imagemagick
    imath
    jansson
    jasper
    jbig2dec
    jemalloc
    jenv
    jpeg
    jq
    krb5
    kubernetes-cli
    kubernetes-helm
    lame
    leptonica
    libass
    libassuan
    libbluray
    libde265
    libev
    libevent
    libffi
    libgcrypt
    libgpg-error
    libheif
    libidn
    libidn2
    libksba
    liblqr
    libmaxminddb
    libogg
    libomp
    libpng
    libpq
    libpthread-stubs
    librsvg
    libsamplerate
    libsmi
    libsndfile
    libsodium
    libsoxr
    libssh
    libssh2
    libtasn1
    libtiff
    libtool
    libunistring
    libusb
    libuv
    libvidstab
    libvorbis
    libvpx
    libx11
    libxau
    libxcb
    libxdmcp
    libxext
    libxrender
    libyaml
    liquidprompt
    little-cms2
    lsd
    lua
    lua@5.1
    lzo
    m4
    macos-term-size
    makedepend
    md5sha1sum
    minikube
    miniserve
    most
    mpdecimal
    multitail
    mycli
    ncurses
    netcat
    netpbm
    nettle
    nghttp2
    node
    node@12
    npth
    nushell
    oniguruma
    opencore-amr
    openexr
    openjdk
    openjpeg
    openssl@1.1
    optipng
    opus
    osmfilter
    osmosis
    p11-kit
    p7zip
    pandoc
    pango
    pcre
    pcre2
    perl
    pgcli
    pgloader
    pinentry
    pip-completion
    pixman
    pkg-config
    poetry
    postgresql
    pyenv
    python
    python-tabulate
    python3
    python@2
    python@3.8
    python@3.9
    rav1e
    readline
    redis
    ripgrep
    rtmpdump
    rubberband
    ruby
    rustup-init
    s-lang
    sbcl
    sdl2
    shared-mime-info
    shellcheck
    skaffold
    snappy
    speex
    sqlite
    srt
    starship
    tcl-tk
    tektoncd-cli
    terraform
    terraform@0.13
    terraformer
    tesseract
    theora
    tree
    unbound
    unixodbc
    vagrant-completion
    vault
    vim
    webp
    wget
    wireshark
    x264
    x265
    xmlto
    xorgproto
    xsv
    xvid
    xz
    yarn
    zeromq
    zimg
    zlib

  
  # Install cask formulas.
  brew install --cask \
    alacritty \
    android-platform-tools \
    android-sdk \
    android-studio \
    angry-ip-scanner \
    atom \
    brave-browser \
    chromedriver \
    dbeaver-community \
    deluge \
    dropbox \
    etcher \
    firefox \
    flux \
    font-hack-nerd-font \
    freecad \
    gimp \
    google-chrome \
    iterm2 \
    krita \
    libreoffice \
    marp \
    mu-editor \
    ngrok \
    postman \
    rar \
    rectangle \
    sketchup \
    skype \
    slack \
    sweet-home3d \
    the-battle-for-wesnoth \
    time-out \
    vagrant \
    virtualbox \
    visual-studio-code \
    vlc \
    wireshark \
    xquartz


  # Clean up.
  brew cleanup
fi

