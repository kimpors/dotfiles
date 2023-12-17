#!/bin/bash

# bash
if ! [ -L "$HOME/.bashrc" ]; 
then
  ln -s "$PWD/bash/.bashrc" $HOME
else
  echo "bashrc symlink already exists"
fi

if ! [ -L "$HOME/.bash_profile" ];
then
  ln -s "$PWD/bash/.bash_profile" $HOME
else
  echo "bash_profile symlink already exists"
fi

# nvim
if ! [ -L "$XDG_CONFIG_HOME/nvim" ]; 
then
  ln -s  "$PWD/nvim" $XDG_CONFIG_HOME
else
  echo "nvim/ symlink already exists"
fi

# mpd
if ! [ -d "$XDG_CONFIG_HOME/mpd" ]; then
  mkdir "$XDG_CONFIG_HOME/mpd"
fi

if ! [ -L "$XDG_CONFIG_HOME/mpd/mpd.conf" ];
then
  ln -s "$PWD/mpd/mpd.conf" "$XDG_CONFIG_HOME/mpd"
else
  echo "mpd.conf symlink already exists"
fi

# ncmpcpp
if ! [ -d "$XDG_CONFIG_HOME/ncmpcpp" ]; then
  mkdir "$XDG_CONFIG_HOME/ncmpcpp"
fi

if ! [ -L "$XDG_CONFIG_HOME/ncmpcpp/config" ];
then
  ln -s "$PWD/ncmpcpp/config" "$XDG_CONFIG_HOME/ncmpcpp"
else
  echo "ncmpcpp/config symlink already exists"
fi

#vieb
if ! [ -L "$XDG_CONFIG_HOME/viebrc" ]; 
then
  ln -s "$PWD/vieb/viebrc" $XDG_CONFIG_HOME
else
  echo "viebrc symlink already exists"
fi

#user scripts
if ! [ -L "$XDG_DATA_HOME/bin" ];
then
  ln -s "$PWD/bin" $XDG_DATA_HOME
else
  echo "bin/ symlink already exists"
fi
