mydot
=====

my vim and other configuraion
--------

Prepare dotfiles:
- sudo apt install stow
- git clone https://github.com/comdvas/mydot.git ~/.dotfiles

Install configuration (vim for example):
- cd ~/.dotfiles
- stow vim

To disable configuration (vim for example):
- cd ~/.dotfiles
- stow -D vim
