VSCODE_DIR = ~/Library/Application\ Support/Code/User
SELF_VSCODE_DIR = $(MODULE_DIR)/vscode

CLEAN_TARGETS += vscode-clean
INSTALL_TARGETS += vscode-install

.PHONY: vscode-clean
vscode-clean:
	rm -rf $(VSCODE_DIR)/settings.json
	rm -rf $(VSCODE_DIR)/keybindings.json

.PHONY: vscode-install
vscode-install:
	ln -sf $(SELF_VSCODE_DIR)/settings.json $(VSCODE_DIR)/settings.json
	ln -sf $(SELF_VSCODE_DIR)/keybindings.json $(VSCODE_DIR)/keybindings.json
