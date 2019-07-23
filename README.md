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

fonts for debian
------------------

```
sudo apt install fonts-roboto fonts-hack-ttf fonts-liberation ttf-mscorefonts-installer ttf-dejavu fonts-freefont-ttf fonts-cantarell ttf-dejavu texlive-fonts-extra fonts-noto fonts-symbola gsfonts fonts-texgyre fonts-crosextra-caladea fonts-crosextra-carlito
```

clipboard
------------------

For clipboard support used lemonade and autocutsel.

https://github.com/pocke/lemonade

```
apt install autocutsel
cd ~/bin
wget https://github.com/pocke/lemonade/releases/download/v1.1.1/lemonade_linux_amd64.tar.gz
tar zxvpf lemonade_linux_amd64.tar.gz
```

Connect to remote host (you need to install lemonade on remote host too):

```
remote user@remotehost.com
```
