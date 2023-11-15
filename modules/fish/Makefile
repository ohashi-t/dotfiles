FISH_DIR = ~/.config/fish
SELF_FISH_DIR = $(MODULE_DIR)/fish

CLEAN_TARGETS += fish-shell-clean
INSTALL_TARGETS += fish-shell-install

.PHONY: fish-shell-clean
fish-shell-clean:
	rm -rf $(FISH_DIR)/config.fish
	

.PHONY: fish-shell-install
fish-shell-install:
	mkdir -p $(FISH_DIR)
	ln -sf $(SELF_FISH_DIR)/config.fish $(FISH_DIR)/config.fish
