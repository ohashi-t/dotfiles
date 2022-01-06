VIM_SETTING_DIR = ~/.config/vim_setting
VIM_AFTER_PLUGIN_DIR = ~/.vim/after/plugin
SELF_VIM_SETTING_DIR = $(MODULE_DIR)/vim/vim_setting
SELF_VIM_AFTER_PLUGIN_DIR = $(MODULE_DIR)/vim/after/plugin

CLEAN_TARGETS += vim-clean
INSTALL_TARGETS += vim-install

.PHONY: vim-clean
vim-clean:
	rm -rf $(VIM_SETTING_DIR)
	rm -rf $(VIM_AFTER_PLUGIN_DIR)

.PHONY: vim-install
vim-install:
	mkdir -p $(VIM_SETTING_DIR)
	ln -sf $(SELF_VIM_SETTING_DIR)/base.vimrc $(VIM_SETTING_DIR)/base.vimrc
	mkdir -p $(VIM_AFTER_PLUGIN_DIR)
	ln -sf $(SELF_VIM_AFTER_PLUGIN_DIR)/common-settings.vim $(VIM_AFTER_PLUGIN_DIR)/common-settings.vim
