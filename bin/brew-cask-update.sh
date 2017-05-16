#!/bin/bash
set -euo pipefail

# Update the brews.
brew update
brew upgrade

# Upgrade the packages.
brew cu -y

# Clean up.
brew cleanup
brew cask cleanup
brew cu --cleanup
