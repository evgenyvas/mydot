mydot
=====

my configuration dotfiles
-------------------------

Prepare dotfiles:
- sudo apt install stow git
- git clone https://github.com/evgenyvas/mydot.git ~/.dotfiles

Install configuration (neovim for example):
- cd ~/.dotfiles
- stow neovim

To disable configuration (neovim for example):
- cd ~/.dotfiles
- stow -D neovim

install patched terminal font
-----------------------------

```
mkdir ~/Downloads/font
cd ~/Downloads/font
curl -OL https://github.com/ryanoasis/nerd-fonts/releases/latest/download/Noto.tar.xz
tar xvpf Noto.tar.xz
sudo mkdir /usr/local/share/fonts/nerd
sudo cp NotoSansMNerdFontMono-Regular.ttf /usr/local/share/fonts/nerd/
sudo dpkg-reconfigure fontconfig-config
```

fonts for debian
------------------

At first, add "contrib non-free" repositories in sources.list

```
sudo apt install fonts-roboto fonts-hack-ttf fonts-liberation ttf-mscorefonts-installer fonts-dejavu fonts-freefont-ttf fonts-cantarell texlive-fonts-extra fonts-noto fonts-symbola gsfonts fonts-texgyre fonts-crosextra-caladea fonts-crosextra-carlito
```

clipboard
---------

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

install lua and deps for neovim
-------------------------------

```
sudo apt install lua5.4 luarocks fd-find tree-sitter-cli
```

install xkb-switch for neovim layout switch
-------------------------------------------

```
sudo apt install libxkbfile-dev
git clone https://github.com/grwlf/xkb-switch.git
cd xkb-switch
mkdir build && cd build
cmake ..
make
sudo make DESTDIR=/usr/local/stow/xkb-switch-1.8.5 install
sudo su
cd /usr/local/stow/xkb-switch-1.8.5
sudo cp -r ./usr/local/* ./
sudo rm -r ./usr
cd ..
stow xkb-switch-1.8.5
ldconfig
```
