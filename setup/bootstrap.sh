#!/bin/bash
set -euo pipefail

# Define variables
APP_NAME=osx-restore
SRC_DIR=/usr/local/src
OSX_RESTORE_DIR="${SRC_DIR}/${APP_NAME}"

# Install XCode.
touch /tmp/.com.apple.dt.CommandLineTools.installondemand.in-progress
PROD=$(softwareupdate -l | grep "\*.*Command Line" | head -n 1 | awk -F"*" '{print $2}' | sed -e 's/^ *//' | tr -d '\n')
softwareupdate -i "$PROD" --verbose
rm /tmp/.com.apple.dt.CommandLineTools.installondemand.in-progress

# Install Brew.
brew --version || /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install Git.
brew update && brew install git

# Prepare ${OSX_RESTORE_DIR} and clone osx-restore.
sudo mkdir -p "${OSX_RESTORE_DIR}" && sudo chown "${USER}" "${SRC_DIR}"
git -C "${OSX_RESTORE_DIR}" pull || git clone https://github.com/rgreinho/osx-restore.git
