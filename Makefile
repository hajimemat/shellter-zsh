.PHONY: ~/.zsh/functions ~/.zshrc ~/.zshenv
install:
	make ~/.zsh/functions
	make ~/.zshrc
	make ~/.zshenv
	make ~/.zshrc.local
	make ~/.zplug
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
~/.zplug:
	curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh| zsh
