mydot
=====

my vim and other configuraion
-----------------------------

Prepare dotfiles:
- sudo apt install stow git
- git clone https://github.com/comdvas/mydot.git ~/.dotfiles

Install configuration (vim for example):
- cd ~/.dotfiles
- stow vim

To disable configuration (vim for example):
- cd ~/.dotfiles
- stow -D vim

compile lxterminal
------------------

For neovim needed lxterminal with gtk3.

https://github.com/lxde/lxterminal

```
./configure --prefix=/usr/local/stow/lxterminal-0.3.0-gtk3 --enable-gtk3 --enable-man
```

