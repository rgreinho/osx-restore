# Misc.
SHELL = /bin/bash
VIM_SPF13_HOME = $$HOME/.spf13-vim-3
OSX_RESTORE_DIR = $(SRC_DIR)/osx-restore

default: setup

help: # Display help
	@awk -F ':|##' \
		'/^[^\t].+?:.*?##/ {\
			printf "\033[36m%-30s\033[0m %s\n", $$1, $$NF \
		}' $(MAKEFILE_LIST) | sort

bash: ## Setup Bash
	@ls bash | xargs -I {} ln -sf ${PWD}/bash/{} ~/.{}

brew: ## Install packages with Brew
	@bash setup/brew.sh

editorconfig: ## Configure EditorConfig
	@ln -sf ${PWD}/conf/editorconfig ~/.editorconfig

fonts: ## Enable the fonts tap and install some fonts
	@bash setup/fonts.sh

git: ## Configure git
	@git config --global alias.s status
	@git config --global alias.ls 'log --pretty=format:"%C(yellow)%h\ %Cgreen%ad%Cred%d\ %Creset%s%Cblue\ [%cn]" --decorate --date=short'
	@git config --global alias.lsg 'log --pretty=format:"%C(yellow)%h\ %Cgreen%ad%Cred%d\ %Creset%s%Cblue\ [%cn]" --decorate --date=short --graph'
	@git config --global core.editor vim

init: ## Initialize the setup
	export OSXR_BREW_FORCE_INSTALL=1 \
		&& bash setup/bootstrap.sh

vim: ## Install and configure Vim SPF13
	curl -sLf https://spacevim.org/install.sh | bash

setup: init bash brew editorconfig fonts git vim ## Full setup

.PHONY: bash brew editorconfig fonts git init setup vim
