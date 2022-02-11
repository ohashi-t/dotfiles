CUSTOM_BIN_DIR = ~/.cache/custom_bin
SELF_CUSTOM_BIN_DIR = $(MODULE_DIR)/custom_bin

CLEAN_TARGETS += custom-bin-clean
INSTALL_TARGETS += custom-bin-install

.PHONY: custom-bin-clean
custom-bin-clean:
	rm -rf $(CUSTOM_BIN_DIR)

.PHONY: custom-bin-install
custom-bin-install:
	mkdir -p $(CUSTOM_BIN_DIR)
	ln -sf $(SELF_CUSTOM_BIN_DIR)/solargraph $(CUSTOM_BIN_DIR)/solargraph
