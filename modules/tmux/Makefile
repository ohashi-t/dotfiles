TMUX_SOURCE_DIR = ~/.config/tmux_source
TMUX_SOURCE_FILE_DIR = $(TMUX_SOURCE_DIR)/file
TMUX_SOURCE_HOOK_DIR = $(TMUX_SOURCE_DIR)/hook
SELF_TMUX_SOURCE_DIR = $(MODULE_DIR)/tmux/tmux_source
SELF_TMUX_SOURCE_FILE_DIR = $(SELF_TMUX_SOURCE_DIR)/file
SELF_TMUX_SOURCE_HOOK_DIR = $(SELF_TMUX_SOURCE_DIR)/hook

CLEAN_TARGETS += tmux-clean
INSTALL_TARGETS += tmux-install

.PHONY: tmux-clean
tmux-clean:
	rm -rf $(TMUX_SOURCE_DIR)
	

.PHONY: tmux-install
tmux-install:
		mkdir -p $(TMUX_SOURCE_FILE_DIR)
		mkdir -p $(TMUX_SOURCE_HOOK_DIR)
		ln -sf $(SELF_TMUX_SOURCE_FILE_DIR)/at_terminal_starting.conf $(TMUX_SOURCE_FILE_DIR)/at_terminal_starting.conf
		ln -sf $(SELF_TMUX_SOURCE_FILE_DIR)/setup_tmux $(TMUX_SOURCE_FILE_DIR)/setup_tmux
