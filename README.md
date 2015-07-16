mydot
=====

my vim and other configuraion
--------
##Install configuration (vim for example):
- sudo apt install stow
- cd
- git clone https://github.com/comdvas/mydot.git ~/.dotfiles
- cd ~/.dotfiles
- stow vim
##To disable configuration (vim for example):
- cd ~/.dotfiles
- stow -D vim
##Install vim plugins:
- git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
- in vim type: `:PluginInstall`&lt;enter&gt;
