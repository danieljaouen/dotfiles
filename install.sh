#!/usr/bin/env bash

# prerequisites:
# - git
# - zsh
# - emacs
# - vim
# - nvim
# - asdf
# - erlang
# - elixir
# - tmux
# - ruby
# - rake
# - starship
# - fzf (and its install script)

mkdir -p ~/.config
mkdir -p ~/.tmux/bundle
mkdir -p ~/src

git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/syl20bnr/spacemacs.git ~/.emacs.d
git clone https://github.com/danieljaouen/AstroNvim.git ~/.config/nvim
git clone https://github.com/tmux-plugins/tpm.git ~/.tmux/plugins/tpm
git clone https://github.com/elixir-lsp/elixir-ls.git ~/src/elixir-ls
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

cd ~/src/elixir-ls
mix local.hex --force
mix local.rebar --force
mix deps.get
mix compile
mix elixir_ls.release -o release
cd -

# remember to remove ~/.config/nvim/init.vim !!
