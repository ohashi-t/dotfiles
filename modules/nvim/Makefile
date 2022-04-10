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
	$(eval \
		$(call \
			nvim-rule, \
			$(NVIM_DIR)/$(notdir $(source)), \
			$(source) \
		) \
	) \
)
$(warning MAKE = $(NVIM_TARGETS))

$(foreach source, $(SELF_NVIM_PLUGIN_FILES), \
	$(eval \
		$(call \
			nvim-rule, \
			$(NVIM_PLUGIN_DIR)/$(notdir $(source)), \
			$(source) \
		) \
	) \
)

$(foreach source, $(SELF_NVIM_SNIPPET_FILES), \
	$(eval \
		$(call \
			nvim-rule, \
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

.PHONY: nvim-cache-clean
nvim-cache-clean:
	rm -rf $(NVIM_CACHE_DIR)

.PHONY: nvim-cache-init
nvim-cache-init:
	mkdir -p $(NVIM_CACHE_DIR)
	curl $(NVIM_DEIN_URL) > dein_installer.sh
	sh dein_installer.sh $(NVIM_CACHE_DIR)
	rm dein_installer.sh
