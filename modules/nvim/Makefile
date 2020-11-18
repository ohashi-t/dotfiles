NVIM_DIR = ~/.config/nvim
SELF_NVIM_DIR = $(MODULE_DIR)/nvim

CLEAN_TARGETS += nvim-clean
INSTALL_TARGETS += nvim-install

.PHONY: nvim-clean
nvim-clean:
	rm -rf $(NVIM_DIR)/init.vim

.PHONY: nvim-install
nvim-install:
	ln -sf $(SELF_NVIM_DIR)/init.vim $(NVIM_DIR)/init.vim