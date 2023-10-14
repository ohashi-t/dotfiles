BREWFILE_DIR = ~/.config/brewfile

.PHONY: brew-install
brew-install: $(BREWFILE_DIR)
	cat $(MODULE_DIR)/brew/Brewfile > $(BREWFILE_DIR)/Brewfile
	brew bundle install --file $(BREWFILE_DIR)/Brewfile

$(BREWFILE_DIR):
	mkdir -p $(BREWFILE_DIR)

.PHONY: brew-clean
brew-clean:
	rm -rf $(BREWFILE_DIR)
