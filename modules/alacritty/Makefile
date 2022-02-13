ALACRITTY_DIR = ~/.config/alacritty
ALACRITTY_THEME_DIR = ~/.config/alacritty-theme
SELF_ALACRITTY_DIR = $(MODULE_DIR)/alacritty

ALACRITTY_THEME_GITHUB = https://github.com/eendroroy/alacritty-theme.git

CLEAN_TARGETS += alacritty-clean
INSTALL_TARGETS += alacritty-install

.PHONY: alacritty-clean
alacritty-clean:
	rm -rf $(ALACRITTY_DIR)

.PHONY: alacritty-install
alacritty-install: $(ALACRITTY_DIR)

.PHONY: alacritty-theme-pull
alacritty-theme-pull: $(ALACRITTY_THEME_DIR)

$(ALACRITTY_DIR):
	mkdir -p $(ALACRITTY_DIR)
	ln -sf $(SELF_ALACRITTY_DIR)/alacritty.yml $(ALACRITTY_DIR)/alacritty.yml

$(ALACRITTY_THEME_DIR):
	mkdir -p $(ALACRITTY_DIR)
	git clone --depth=1 $(ALACRITTY_THEME_GITHUB) $(ALACRITTY_THEME_DIR)
