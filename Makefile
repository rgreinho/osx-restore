# Misc.
SHELL = /bin/bash
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
	@git config --global alias.can 'commit -a --amend --no-edit'
	@git config --global alias.cans 'commit -a --amend --no-edit -s -S'
	@git config --global core.editor vim
	@git config --global core.pager delta
	@git config --global interactive.diffFilter 'delta --color-only --features=interactive'
	@git config --global delta.features decorations
	@git config --global delta.line-numbers true
	@git config --global delta.interactive.keep-plus-minus-markers false
    @git config --global delta.decorations.commit-decoration-style 'blue ol'
    @git config --global delta.decorations.commit-style raw
    @git config --global delta.decorations.file-style omit
    @git config --global delta.decorations.hunk-header-decoration-style 'blue box'
    @git config --global delta.decorations.hunk-header-file-style red
    @git config --global delta.decorations.hunk-header-line-number-style '#067a00'
    @git config --global delta.decorations.hunk-header-style 'file line-number syntax'
	@git config --global commit.gpgsign true  # Sign all commits
	@git config --global tag.gpgsign true  # Sign all tags
	@git config --global gpg.x509.program gitsign  # Use Gitsign for signing
	@git config --global gpg.format x509  # Gitsign expects x509 args
	@git config --global gitsign.connectorID https://github.com/login/oauth
	@git config --global init.defaultBranch main

init: ## Initialize the setup
	export OSXR_BREW_FORCE_INSTALL=1 \
		&& bash setup/bootstrap.sh

starship: ## Configure Startship prompt
	@mkdir -p ~/.config
	@ln -sf ${PWD}/conf/startship.toml ~/.config/startship.toml

setup: init bash brew editorconfig fonts git ## Full setup

.PHONY: bash brew editorconfig fonts git init setup
