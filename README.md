# Description

My Vim config. Expect frequent changes.

# Installation

Clone this repo:

    git clone git://github.com/teoulas/vimfiles.git ~/.vim
    
Install [Vundle](https://github.com/gmarik/vundle)

    git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
    vim +BundleInstall +qall

Then, either create a new .vimrc file or add the following line to your existing one:

    source ~/.vim/vimrc

If you want to use Command-T you have to compile the C extension:

    cd ~/.vim/bundle/Command-T/ruby/command-t
    ruby extconf.rb
    make
