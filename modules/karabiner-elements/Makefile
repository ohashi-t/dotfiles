KARABINER_DIR = ~/.config/karabiner
ASSETS_DIR = $(KARABINER_DIR)/assets
COMPLEX_MODIFICATIONS_DIR = $(ASSETS_DIR)/complex_modifications
COMPLEX_MODIFICATIONS_JSON := $(wildcard $(COMPLEX_MODIFICATIONS_DIR)/*.json)

SELF_KARABINER_DIR = $(MODULE_DIR)/karabiner-elements
SELF_ASSETS_DIR = $(SELF_KARABINER_DIR)/assets
SELF_COMPLEX_MODIFICATIONS_DIR = $(SELF_ASSETS_DIR)/complex_modifications
SELF_COMPLEX_MODIFICATIONS_JSON := $(wildcard $(SELF_COMPLEX_MODIFICATIONS_DIR)/*.json)

CLEAN_TARGETS += karabiner-clean
INSTALL_TARGETS += karabiner-install

# $< -> 依存関係の一番最初。この場合は$2を指す。フルパス。
# $@ -> ターゲット名。この場合は$1を指す。フルパス。
define karabiner-rule
KARABINER_TARGETS += $1

$1: $2
	ln -sf $$< $$@
endef

$(foreach source, $(SELF_COMPLEX_MODIFICATIONS_JSON), \
	$(eval \
		$(call \
			karabiner-rule, \
			$(COMPLEX_MODIFICATIONS_DIR)/$(notdir $(source)), \
			$(source) \
		) \
	) \
)

.PHONY: karabiner-clean
karabiner-clean:
	rm -rf $(KARABINER_DIR)/karabiner.json
	rm -rf $(COMPLEX_MODIFICATIONS_JSON)

.PHONY: karabiner-install
karabiner-install: $(KARABINER_TARGETS)
	ln -sf $(SELF_KARABINER_DIR)/karabiner.json $(KARABINER_DIR)/karabiner.json