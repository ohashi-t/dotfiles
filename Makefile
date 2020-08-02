TOP_DIR := $(realpath $(dir $(lastword $(MAKEFILE_LIST))))
link:
	ln -s $(TOP_DIR)/.vimrc ~/.vimrc
	ln -s $(TOP_DIR)/.ideavimrc ~/.ideavimrc
	ln -s $(TOP_DIR)/.zshrc ~/.zshrc
	ln -s $(TOP_DIR)/.tmux.conf ~/.tmux.conf
	ln -s $(TOP_DIR)/.irbrc ~/.irbrc
	ln -s $(TOP_DIR)/config.fish ~/.config/fish/config.fish
	ln -s $(TOP_DIR)/fish_variables ~/.config/fish/fish_variables
	ln -s $(TOP_DIR)/karabiner.json ~/.config/karabiner/karabiner.json
	ln -s $(TOP_DIR)/init.vim ~/.config/nvim/init.vim

clean:
	rm -f ~/.vimrc
	rm -f ~/.ideavimrc
	rm -f ~/.zshrc
	rm -f ~/.tmux.conf
	rm -f ~/.irbrc
	rm -f ~/.config/fish/config.fish
	rm -f ~/.config/fish/fish_variables
	rm -f ~/.config/karabiner/karabiner.json
	rm -f ~/.config/nvim/init.vim
