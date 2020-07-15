TOP_DIR := $(realpath $(dir $(lastword $(MAKEFILE_LIST))))
link:
	ln -s $(TOP_DIR)/.vimrc ~/.vimrc

clean:
	rm ~/.vimrc
