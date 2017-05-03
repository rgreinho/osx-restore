# Misc.
EXTRAS=nojhan/liquidprompt.git altercation/solarized.git tonsky/FiraCode.git
SHELL = /bin/bash
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

setup: bash brew extras ## Full setup

.PHONY: bash brew extras setup
