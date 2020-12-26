KARABINER_DIR = ~/.config/karabiner
SELF_KARABINER_DIR = $(MODULE_DIR)/karabiner-elements

CLEAN_TARGETS += karabiner-clean
INSTALL_TARGETS += karabiner-install

.PHONY: karabiner-clean
karabiner-clean:
	rm -rf $(KARABINER_DIR)/karabiner.json

.PHONY: karabiner-install
karabiner-install:
	ln -sf $(SELF_KARABINER_DIR)/karabiner.json $(KARABINER_DIR)/karabiner.json