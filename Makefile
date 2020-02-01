install:
	make ~/.zsh/functions
	make ~/.zshrc
	make ~/.zshenv
	make ~/.zshrc.local
~/.zsh:
	mkdir $@
~/.zsh/functions: ~/.zsh
	ln -s $(realpath ./functions) $@
~/.zshrc:
	ln -s $(realpath ./_zshrc) $@
~/.zshenv:
	ln -s $(realpath ./_zshenv) $@
~/.zshrc.local:
	ln -s $(realpath ./_zshrc.local) $@
