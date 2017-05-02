#!/bin/bash
set -euo pipefail

# Update the brews.
brew update
brew upgrade

# Upgrade the packages.
brew cask list | xargs brew cask install

# Clean up.
brew cleanup
brew cask cleanup
