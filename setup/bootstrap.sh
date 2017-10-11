#!/bin/bash
set -euo pipefail

# Define variables
SRC_DIR=/usr/local/src
OSX_RESTORE_DIR=${SRC_DIR}/osx-restore

xcode-select --install 2>/dev/null || True
brew --version || /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew update && brew install git
sudo mkdir -p "${SRC_DIR}" && chown "${USER}" "${SRC_DIR}"
git -C "${OSX_RESTORE_DIR}" pull || git clone https://github.com/rgreinho/osx-restore.git "${OSX_RESTORE_DIR}"
