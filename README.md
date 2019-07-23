mydot
=====

my configuraion dotfiles
------------------------

Prepare dotfiles:
- sudo apt install stow git
- git clone https://github.com/evgenyvas/mydot.git ~/.dotfiles

Install configuration (neovim for example):
- cd ~/.dotfiles
- stow neovim

To disable configuration (neovim for example):
- cd ~/.dotfiles
- stow -D neovim

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
