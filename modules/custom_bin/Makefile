CUSTOM_BIN_DIR = ~/.cache/custom_bin
CUSTOM_BIN_SCRIPTS := $(wildcard $(CUSTOM_BIN_DIR)/*)
SELF_CUSTOM_BIN_DIR = $(MODULE_DIR)/custom_bin
SELF_CUSTOM_BIN_SCRIPTS := $(wildcard $(SELF_CUSTOM_BIN_DIR)/*)

CLEAN_TARGETS += custom-bin-clean
INSTALL_TARGETS += custom-bin-install

define custom-bin-rule
CUSTOM_BIN_TARGETS += $1

$1: $2
	ln -sf $$< $$@
endef

$(foreach source, $(SELF_CUSTOM_BIN_SCRIPTS), \
	$(eval \
		$(call \
			custom-bin-rule, \
			$(CUSTOM_BIN_DIR)/$(notdir $(source)), \
			$(source) \
		) \
	) \
)

.PHONY: custom-bin-clean
custom-bin-clean:
	rm -rf $(CUSTOM_BIN_DIR)

.PHONY: custom-bin-install
custom-bin-install: make-custom-bin-dir $(CUSTOM_BIN_TARGETS)

.PHONY: make-custom-bin-dir
make-custom-bin-dir:
	mkdir -p $(CUSTOM_BIN_DIR)
