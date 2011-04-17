#!/bin/sh
bashRC="$1" 
if [[ "$bashRC" == "" ]]; then 
	bashRC="bashRC"
fi
bashRC="~/.$bashRC"
echo "dotFiles installation FTW!"
if [[ ! -d ~/.vim && ! -L ~/.vim ]] ; then
    echo "Install vim first!" && exit 1
fi

if ( grep "dotFiles start" ~/.vimrc -q ); then
	echo "dotFiles found at vimrc"
else
	echo "adding dotFiles to vimrc" && echo '"dotFiles start\nsource ~/.vim_add\n"dotFiles end' >> ~/.vimrc
fi

if ( grep "dotFiles start" <$bashRC> -q ); then
	echo "dotFiles found at bashrc"
else
	echo "adding dotFiles to bashrc" && echo '#dotFiles start\nif [ -f ~/.bash_add ]; then\nsource ~/.bash_add\nfi\n#dotFiles end' >> $bashRC
fi

if [[ -f ~/.bash_add ]]; then
	echo "bash profile addon already exists"
else
	cp useroot/bash_add ~/.bash_add && echo "Copying bash profile addon"
fi

if [[ -f ~/.vim_add ]]; then
	echo "vim profile addon already exists"
else
	cp useroot/vim_add ~/.vim_add && echo "Copying vim profile addon"
fi

if [[ -f ~/.git-completion.bash ]]; then
	echo "git completion for bash already exists"
else
	cp useroot/git-completion.bash ~/.git-completion.bash && echo "Copying git completion for bash"
fi
if [[ -f ~/.vim/vundle.git/.git/config ]]; then
	echo "vundle already exists"
else
	echo "cloning vundle" && git clone https://github.com/gmarik/vundle.git ~/.vim/vundle.git
fi
echo "You're good to go! Restart you terminal and open vim, and run :BundleInstall"
