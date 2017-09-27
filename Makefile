# Misc.
EXTRAS = nojhan/liquidprompt.git altercation/solarized.git tonsky/FiraCode.git
SHELL = /bin/bash
VIM_SPF13_HOME = $$HOME/.spf13-vim-3
SRC_DIR = /usr/local/src
OSX_RESTORE_DIR = $(SRC_DIR)/osx-restore

default: setup

help: # Display help
	@awk -F ':|##' \
		'/^[^\t].+?:.*?##/ {\
			printf "\033[36m%-30s\033[0m %s\n", $$1, $$NF \
		}' $(MAKEFILE_LIST) | sort

bash: ## Setup Bash
	@ls bash | xargs -I {} ln -sf ${PWD}/bash/{} ~/.{}

brew: init ## Install packages with Brew
	@bash setup/brew.sh
	@ln -sf ${PWD}/bin/brew-cask-update.sh /usr/local/bin/brew-cask-update

editorconfig: ## Configure EditorConfig
	@ln -sf ${PWD}/conf/editorconfig ~/.editorconfig

extras: ## Install extras from Github
	@{ \
		mkdir -p $(SRC_DIR); \
		cd $(SRC_DIR); \
		for EXTRA in $(EXTRAS); do \
			git -C "$$(basename "$$EXTRA" .git)" pull  || git clone "https://github.com/$$EXTRA"; \
		done \
	}

git: ## Configure git
	@git config --global alias.s status
	@git config --global alias.ls 'log --pretty=format:"%C(yellow)%h\ %Cgreen%ad%Cred%d\ %Creset%s%Cblue\ [%cn]" --decorate --date=short'
	@git config --global alias.lsg 'log --pretty=format:"%C(yellow)%h\ %Cgreen%ad%Cred%d\ %Creset%s%Cblue\ [%cn]" --decorate --date=short --graph'
	@git config --global core.editor vim

init: ## Initialize the setup
	@brew --version || /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	@brew update && brew install git
	@git -C "${OSX_RESTORE_DIR}" pull  || git clone https://github.com/rgreinho/osx-restore.git "${OSX_RESTORE_DIR}"

vim: ## Install and configure Vim SPF13
	@{ \
		if [ -d "$(VIM_SPF13_HOME)/" ]; then \
			git fetch; \
			if ! git -C "$(VIM_SPF13_HOME)" diff --quiet remotes/origin/HEAD; then \
				git -C "$(VIM_SPF13_HOME)" pull 2>/dev/null; \
				vim +BundleInstall! +BundleClean +q!; \
			fi \
		else \
			sh <(curl https://j.mp/spf13-vim3 -L); \
		fi \
	}

setup: bash brew editorconfig extras git vim ## Full setup

.PHONY: bash brew editorconfig extras git init setup vim
