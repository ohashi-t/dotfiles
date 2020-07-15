TOP_DIR := $(realpath $(dir $(lastword $(MAKEFILE_LIST))))
link:
	ln -s $(TOP_DIR)/.vimrc ~/.vimrc
	ln -s $(TOP_DIR)/.zshrc ~/.zshrc
	ln -s $(TOP_DIR)/.tmux.conf ~/.tmux.conf

clean:
	rm -f ~/.vimrc
	rm -f ~/.zshrc
	rm -f ~/.tmux.conf
