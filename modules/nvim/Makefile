NVIM_DIR = ~/.config/nvim
NVIM_PLUGIN_DIR = $(NVIM_DIR)/plugins
NVIM_SNIPPET_DIR = $(NVIM_DIR)/snippets
NVIM_TOML_DIR = $(NVIM_DIR)/toml
NVIM_CACHE_DIR = ~/.cache/dein
SELF_NVIM_DIR = $(MODULE_DIR)/nvim
SELF_NVIM_PLUGIN_DIR = $(SELF_NVIM_DIR)/plugins
SELF_NVIM_SNIPPET_DIR = $(SELF_NVIM_DIR)/snippets
SELF_NVIM_TOML_DIR = $(SELF_NVIM_DIR)/toml
SELF_NVIM_FILES := $(wildcard $(SELF_NVIM_DIR)/*)
SELF_NVIM_PLUGIN_FILES := $(wildcard $(SELF_NVIM_PLUGIN_DIR)/*)
SELF_NVIM_SNIPPET_FILES := $(wildcard $(SELF_NVIM_SNIPPET_DIR)/*)
SELF_NVIM_TOML_FILES := $(wildcard $(SELF_NVIM_TOML_DIR)/*)

NVIM_DEIN_URL = https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh

CLEAN_TARGETS += nvim-clean
INSTALL_TARGETS += nvim-install

define nvim-rule
NVIM_TARGETS += $1

$1: $2
	ln -sf $$< $$@
endef

$(foreach source, $(SELF_NVIM_FILES), \
	$(warning MAKE = $(notdir $(source))) \
	$(eval \
		$(call \
			nvim-rule \
			$(NVIM_DIR)/$(notdir $(source)), \
			$(source) \
		) \
	) \
)

$(foreach source, $(SELF_NVIM_PLUGIN_FILES), \
	$(eval \
		$(call \
			nvim-rule \
			$(NVIM_PLUGIN_DIR)/$(notdir $(source)), \
			$(source) \
		) \
	) \
)

$(foreach source, $(SELF_NVIM_SNIPPET_FILES), \
	$(eval \
		$(call \
			nvim-rule \
			$(NVIM_SNIPPET_DIR)/$(notdir $(source)), \
			$(source) \
		) \
	) \
)

$(foreach source, $(SELF_NVIM_TOML_FILES), \
	$(eval \
		$(call \
			nvim-rule \
			$(NVIM_TOML_DIR)/$(notdir $(source)), \
			$(source) \
		) \
	) \
)


.PHONY: nvim-clean
nvim-clean:
	rm -rf $(NVIM_DIR)

.PHONY: make-nvim-dirs
make-nvim-dirs:
	mkdir -p $(NVIM_DIR)
	mkdir -p $(NVIM_PLUGIN_DIR)
	mkdir -p $(NVIM_SNIPPET_DIR)
	mkdir -p $(NVIM_TOML_DIR)

.PHONY: nvim-install
nvim-install: make-nvim-dirs $(NVIM_TARGETS)

.PHONY: not-nvim-install
not-nvim-install:
	ln -sf $(SELF_NVIM_DIR)/init.vim $(NVIM_DIR)/init.vim
	ln -sf $(SELF_NVIM_DIR)/my_session.vim $(NVIM_DIR)/my_session.vim
	ln -sf $(SELF_NVIM_TOML_DIR)/dein.toml $(NVIM_TOML_DIR)/dein.toml
	ln -sf $(SELF_NVIM_TOML_DIR)/dein_lazy.toml $(NVIM_TOML_DIR)/dein_lazy.toml
	ln -sf $(SELF_NVIM_TOML_DIR)/ddc_with_depends.toml $(NVIM_TOML_DIR)/ddc_with_depends.toml
	ln -sf $(SELF_NVIM_TOML_DIR)/ddu_with_depends.toml $(NVIM_TOML_DIR)/ddu_with_depends.toml
	ln -sf $(SELF_NVIM_PLUGIN_DIR)/defx.vim $(NVIM_PLUGIN_DIR)/defx.vim
	ln -sf $(SELF_NVIM_PLUGIN_DIR)/lexima.vim $(NVIM_PLUGIN_DIR)/lexima.vim
	ln -sf $(SELF_NVIM_PLUGIN_DIR)/denite.vim $(NVIM_PLUGIN_DIR)/denite.vim
	ln -sf $(SELF_NVIM_PLUGIN_DIR)/vim-lsp.vim $(NVIM_PLUGIN_DIR)/vim-lsp.vim
	ln -sf $(SELF_NVIM_PLUGIN_DIR)/coc.vim $(NVIM_PLUGIN_DIR)/coc.vim
	ln -sf $(SELF_NVIM_PLUGIN_DIR)/neosnippet.vim $(NVIM_PLUGIN_DIR)/neosnippet.vim
	ln -sf $(SELF_NVIM_PLUGIN_DIR)/fzf.vim $(NVIM_PLUGIN_DIR)/fzf.vim
	ln -sf $(SELF_NVIM_PLUGIN_DIR)/ddu.vim $(NVIM_PLUGIN_DIR)/ddu.vim
	ln -sf $(SELF_NVIM_SNIPPET_DIR)/rust.snip $(NVIM_SNIPPET_DIR)/rust.snip

.PHONY: nvim-cache-clean
nvim-cache-clean:
	rm -rf $(NVIM_CACHE_DIR)

.PHONY: nvim-cache-init
nvim-cache-init:
	mkdir -p $(NVIM_CACHE_DIR)
	curl $(NVIM_DEIN_URL) > dein_installer.sh
	sh dein_installer.sh $(NVIM_CACHE_DIR)
	rm dein_installer.sh
