#!/bin/bash

VIMINSTALL=${HOME}/.vim-install/
VIMSRC=${HOME}/.vim-source/

sudo apt install tmux zsh libncurses5-dev libgnome2-dev libgnomeui-dev libgtk2.0-dev \
    libatk1.0-dev libbonoboui2-dev libcairo2-dev libx11-dev libxpm-dev libxt-dev python-dev \
    python3-dev ruby-dev lua5.1 lua5.1-dev libperl-dev git

git clone https://github.com/vim/vim.git $VIMSRC
cd $VIMSRC
./configure --with-features=huge \
           --enable-multibyte \
           --enable-rubyinterp=yes \
           --enable-pythoninterp=yes \
           --with-python-config-dir=/usr/lib/python2.7/`ls /usr/lib/python2.7/ | grep "^config"` \
           --enable-python3interp=yes \
           --with-python3-config-dir=/usr/lib/python3.5/`ls /usr/lib/python3.5/ | grep "^config"` \
           --enable-perlinterp=yes \
           --enable-luainterp=yes \
           --enable-gui=gtk2 --enable-cscope --prefix=$VIMINSTALL

sudo make install

git clone https://github.com/gmarik/Vundle ${HOME}/.vim/bundle/Vundle.vim
cd ~/.vim
$VIMINSTALL/bin/vim +PluginInstall +qall

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

rm ~/.zshrc
ln -s ~/.vim/.zshrc ~/.zshrc
ln -s ~/.vim/.tmux.conf ~/.tmux.conf
