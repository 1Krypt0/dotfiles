#!/bin/sh

# To be run in the dotfiles directory only

cd ~/.dotfiles/ || exit
stow -v */
