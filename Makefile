.PHONY: install
install:
	@for SOURCE_DOTFILE in `ls | egrep -v "install.sh|Makefile|README.md|bashrc_local|zsh-ohmyzsh.sh|zsh-autosuggestions.sh|robbyrussell.zsh-theme"` ; \
	do \
		echo "Installing $${SOURCE_DOTFILE}." ; \
		DEST_DOTFILE=~/.$${SOURCE_DOTFILE} ; \
		install -v -b -C -m 644 $$SOURCE_DOTFILE $$DEST_DOTFILE ; \
	done
