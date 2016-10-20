mydot
=====

my vim and other configuraion
--------

Install configuration (vim for example):
- sudo apt install stow
- cd
- git clone https://github.com/comdvas/mydot.git ~/.dotfiles
- cd ~/.dotfiles
- stow vim

To disable configuration (vim for example):
- cd ~/.dotfiles
- stow -D vim

Install vim plugins:
- in vim type: `:PlugInstall`&lt;enter&gt;
