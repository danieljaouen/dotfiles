#!/usr/bin/env bash
#
# -----------------------------------------------------------------------
# Note: this script requires some manual intervention.  Don't just run it
# blindly!
# -----------------------------------------------------------------------

# prerequisites:
# - git
# - zsh
# - emacs
# - nvim
# - asdf
# - erlang
# - elixir
# - tmux
# - ruby
# - starship
# - pyenv
# - fzf (and its install script)
# -  nodejs
# - duf
# - glances

# pacman -Syu
# pacman -Sy neovim
# nvim /etc/ssh/sshd_config # to not allow PasswordLogins
# systemctl reload sshd
# pacman -Sy tmux
# tmux
# pacman -Sy base-devel
# pacman -Sy git
# pacman -Sy zsh
# pacman -Sy emacs
# pacman -Sy erlang
# pacman -Sy elixir
# pacman -Sy ruby
# pacman -Sy starship
# pacman -Sy fzf
# pacman -Sy pyenv
# pacman -Sy nodejs
# pacman -Sy duf
# pacman -Sy glances

mkdir -p ~/.config
mkdir -p ~/.tmux/bundle
mkdir -p ~/src

git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/syl20bnr/spacemacs.git ~/.emacs.d
pushd ~/.emacs.d
git checkout develop
git pull origin develop
popd
git clone --depth 1 https://github.com/AstroNvim/AstroNvim ~/.config/nvim
git clone https://github.com/danieljaouen/AstroNvimUser.git ~/.config/nvim/lua/user
git clone https://github.com/tmux-plugins/tpm.git ~/.tmux/plugins/tpm
git clone https://github.com/elixir-lsp/elixir-ls.git ~/src/elixir-ls
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

pushd ~/src/elixir-ls
mix local.hex --force
mix local.rebar --force
mix deps.get
mix compile
mix elixir_ls.release -o release
popd

git clone https://github.com/danieljaouen/dotfiles.git ~/.dotfiles
pushd ~/.dotfiles
git checkout main
git pull origin main
rake
popd


# -----------------------------
# manually:
# -----------------------------
chsh # to /usr/bin/zsh or /usr/local/bin/zsh
tmux # --> C-t I
nv ~/.tmux.conf
# :TSInstall! lua
# :TSInstall! elixir
# :TSInstall! python
emacs
emacs
# open a file
# M-x copilot-login
