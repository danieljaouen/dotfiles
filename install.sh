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
# - starship
# - pyenv
# - fzf (and its install script)

# pacman -Syu
# pacman -Sy vim
# edit /etc/ssh/sshd_config to not allow PasswordLogins
# systemctl reload sshd
# pacman -Sy tmux
# tmux
# pacman -Sy base-devel
# pacman -Sy git
# pacman -Sy zsh
# pacman -Sy emacs
# pacman -Sy neovim
# pacman -Sy erlang
# pacman -Sy elixir
# pacman -Sy ruby
# pacman -Sy starship
# pacman -Sy fzf
# pacman -Sy pyenv

mkdir -p ~/.config
mkdir -p ~/.tmux/bundle
mkdir -p ~/src

git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/syl20bnr/spacemacs.git ~/.emacs.d
cd ~/.emacs.d
git checkout develop
git pull origin develop
cd -
git clone https://github.com/danieljaouen/AstroNvim.git ~/.config/nvim
cd ~/.config/nvim
git checkout dan
git pull origin dan
cd -
git clone https://github.com/tmux-plugins/tpm.git ~/.tmux/plugins/tpm
git clone https://github.com/elixir-lsp/elixir-ls.git ~/src/elixir-ls
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

cd ~/src/elixir-ls
mix local.hex --force
mix local.rebar --force
mix deps.get
mix compile
mix elixir_ls.release -o release
cd -

chsh # to /usr/bin/zsh

git clone https://github.com/danieljaouen/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
git checkout main
git pull origin main
rake
cd -
ln -s ~/.dotfiles/topics/tmux/tmux.linux.conf ~/.tmux.conf
# tmux --> C-t I
nv ~/.tmux.conf
vim # :PluginInstall
emacs
emacs
rm ~/.config/nvim/init.vim
