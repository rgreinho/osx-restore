# Misc.
EXTRAS=nojhan/liquidprompt.git altercation/solarized.git tonsky/FiraCode.git
SHELL = /bin/bash
VIM_SPF13_HOME=~/.spf13-vim-3
SRC_DIR=/usr/local/src

default: setup

help: # Display help
	@awk -F ':|##' \
		'/^[^\t].+?:.*?##/ {\
			printf "\033[36m%-30s\033[0m %s\n", $$1, $$NF \
		}' $(MAKEFILE_LIST) | sort

bash: ## Setup Bash
	@ls bash | xargs -I {} ln -s ${PWD}/bash/{} ~/.{}

brew: ## Install packages with Brew
	@bash setup/brew.sh
	@ln -s ${PWD}/bin/brew-cask-update.sh /usr/local/bin/brew-cask-update

extras: ## Install extras from Github
	@{ \
		mkdir -p $(SRC_DIR); \
		cd $(SRC_DIR); \
		for EXTRA in $(EXTRAS); do \
			git clone "https://github.com/$$EXTRA"; \
		done \
	}

git: ## Configure git
	git config --global alias.s status
	git config --global alias.ls 'log --pretty=format:"%C(yellow)%h\ %Cgreen%ad%Cred%d\ %Creset%s%Cblue\ [%cn]" --decorate --date=short'
	git config --global alias.lsg 'log --pretty=format:"%C(yellow)%h\ %Cgreen%ad%Cred%d\ %Creset%s%Cblue\ [%cn]" --decorate --date=short --graph'

vim: ## Install and configure Vim SPF13
	if [ -d "$(VIM_SPF13_HOME)" ]; then \
		git -C "$(VIM_SPF13_HOME)" pull 2>/dev/null; \
		vim +BundleInstall! +BundleClean +q; \
	else \
		sh <(curl https://j.mp/spf13-vim3 -L); \
	fi

setup: bash brew extras git vim ## Full setup

.PHONY: bash brew extras setup
