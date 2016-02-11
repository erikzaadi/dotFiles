" Vim config - optimized for minimalism

if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -sfLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall | source ~/.vimrc
endif
set nocompatible              " be iMproved, required
call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-sensible'
call plug#end()
