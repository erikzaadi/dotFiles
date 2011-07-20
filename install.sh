#!/bin/bash
echo "dotFiles installation FTW!"
mkdir -p ~/.vim

if ( grep "dotFiles start" ~/.vimrc -q ); then
	echo "dotFiles found at vimrc"
else
	echo "adding dotFiles to vimrc" && echo '"dotFiles start
source ~/.vim_add
"dotFiles end' >> ~/.vimrc
fi

if ( grep "dotFiles start" ~/.bashrc -q ); then
	echo "dotFiles found at bashrc"
else
	echo "adding dotFiles to bashrc" && echo '#dotFiles start
if [ -f ~/.bash_add ]; then 
    source ~/.bash_add
fi 
#dotFiles end' >> ~/.bashrc 
fi

current=$(pwd)

echo 'Adding bash addons'
rm -rf ~/.bash_add
ln -s $current/userroot/bash_add ~/.bash_add

echo 'Adding vim addons'
rm -rf ~/.vim_add
ln -s $current/userroot/vim_add ~/.vim_add

echo 'Adding git bash completion'
rm -rf ~/.git-completion.bash
ln -s $current/userroot/git-conpletion.bash ~/.git-completion.bash

if [ -f ~/.vim/vundle.git/.git/config ]; then
	echo "vundle already exists"
else
	echo "cloning vundle" && git clone https://github.com/gmarik/vundle.git ~/.vim/vundle.git
fi

echo 'Installing vim bundles'
vim -c BundleInstall!

echo "You're good to go!"
