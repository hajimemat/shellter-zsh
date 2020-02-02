install:
	make ~/.zsh/functions
	make ~/.zshrc
	make ~/.zshenv
	make ~/.zshrc.local
~/.zsh:
	mkdir $@
~/.zsh/functions: ~/.zsh
	ln -sfv $(realpath ./functions) $@
~/.zshrc:
	ln -sfv $(realpath ./_zshrc) $@
~/.zshenv:
	ln -sfv $(realpath ./_zshenv) $@
~/.zshrc.local:
	cp -v $(realpath ./_zshrc.local) $@
