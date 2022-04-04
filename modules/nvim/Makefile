NVIM_DIR = ~/.config/nvim
NVIM_PLUGINS_DIR = $(NVIM_DIR)/plugins
NVIM_SNIPPETS_DIR = $(NVIM_DIR)/snippets
NVIM_TOML_DIR = $(NVIM_DIR)/toml
NVIM_CACHE_DIR = ~/.cache/dein
SELF_NVIM_DIR = $(MODULE_DIR)/nvim
SELF_NVIM_PLUGINS_DIR = $(SELF_NVIM_DIR)/plugins
SELF_NVIM_SNIPPETS_DIR = $(SELF_NVIM_DIR)/snippets
SELF_NVIM_TOML_DIR = $(SELF_NVIM_DIR)/toml

NVIM_DEIN_URL = https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh

CLEAN_TARGETS += nvim-clean
INSTALL_TARGETS += nvim-install

.PHONY: nvim-clean
nvim-clean:
	rm -rf $(NVIM_DIR)

.PHONY: nvim-install
nvim-install:
	mkdir -p $(NVIM_DIR)
	mkdir -p $(NVIM_PLUGINS_DIR)
	mkdir -p $(NVIM_SNIPPETS_DIR)
	mkdir -p $(NVIM_TOML_DIR)
	ln -sf $(SELF_NVIM_DIR)/init.vim $(NVIM_DIR)/init.vim
	ln -sf $(SELF_NVIM_DIR)/my_session.vim $(NVIM_DIR)/my_session.vim
	ln -sf $(SELF_NVIM_TOML_DIR)/dein.toml $(NVIM_TOML_DIR)/dein.toml
	ln -sf $(SELF_NVIM_TOML_DIR)/dein_lazy.toml $(NVIM_TOML_DIR)/dein_lazy.toml
	ln -sf $(SELF_NVIM_TOML_DIR)/ddc_with_depends.toml $(NVIM_TOML_DIR)/ddc_with_depends.toml
	ln -sf $(SELF_NVIM_TOML_DIR)/ddu_with_depends.toml $(NVIM_TOML_DIR)/ddu_with_depends.toml
	ln -sf $(SELF_NVIM_PLUGINS_DIR)/defx.vim $(NVIM_PLUGINS_DIR)/defx.vim
	ln -sf $(SELF_NVIM_PLUGINS_DIR)/denite.vim $(NVIM_PLUGINS_DIR)/denite.vim
	ln -sf $(SELF_NVIM_PLUGINS_DIR)/vim-lsp.vim $(NVIM_PLUGINS_DIR)/vim-lsp.vim
	ln -sf $(SELF_NVIM_PLUGINS_DIR)/coc.vim $(NVIM_PLUGINS_DIR)/coc.vim
	ln -sf $(SELF_NVIM_PLUGINS_DIR)/neosnippet.vim $(NVIM_PLUGINS_DIR)/neosnippet.vim
	ln -sf $(SELF_NVIM_PLUGINS_DIR)/fzf.vim $(NVIM_PLUGINS_DIR)/fzf.vim
	ln -sf $(SELF_NVIM_PLUGINS_DIR)/ddu.vim $(NVIM_PLUGINS_DIR)/ddu.vim
	ln -sf $(SELF_NVIM_SNIPPETS_DIR)/rust.snip $(NVIM_SNIPPETS_DIR)/rust.snip

.PHONY: nvim-cache-clean
nvim-cache-clean:
	rm -rf $(NVIM_CACHE_DIR)

.PHONY: nvim-cache-init
nvim-cache-init:
	mkdir -p $(NVIM_CACHE_DIR)
	curl $(NVIM_DEIN_URL) > dein_installer.sh
	sh dein_installer.sh $(NVIM_CACHE_DIR)
	rm dein_installer.sh
