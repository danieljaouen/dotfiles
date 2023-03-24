#!/usr/bin/env bash

mkdir -p ~/.config
mkdir -p ~/.tmux/bundle
mkdir -p ~/src

git clone https://github.com/danieljaouen/AstroNvim.git ~/.config/nvim
git clone https://github.com/tmux-plugins/tpm.git ~/.tmux/plugins/tpm
git clone https://github.com/elixir-lsp/elixir-ls.git ~/src/elixir-ls
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

# remember to remove ~/.config/nvim/init.vim !!
