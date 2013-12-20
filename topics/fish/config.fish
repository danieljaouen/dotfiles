# Path to your oh-my-fish.
set fish_path $HOME/.oh-my-fish

# Theme
set fish_theme uggedal

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-fish/plugins/*)
# Custom plugins may be added to ~/.oh-my-fish/custom/plugins/
set fish_plugins autojump brew bundler django ec2 pyenv python rbenv

# setting the PATH -------------------------------------------------------- {{{
set BASE_PATH /bin
set BASE_PATH /sbin $PATH
set BASE_PATH /usr/bin $PATH
set BASE_PATH /usr/sbin $PATH
set BASE_PATH /usr/local/bin $PATH
set BASE_PATH /usr/local/sbin $PATH

set RBENV_PATH $HOME/.rbenv/bin
set RBENV_PATH $HOME/.rbenv/shims $RBENV_PATH

set PYENV_PATH $HOME/.pyenv/bin
set PYENV_PATH $HOME/.pyenv/shims $PYENV_PATH
# /setting the PATH ------------------------------------------------------- }}}

# Path to your custom folder (default path is $FISH/custom)
#set fish_custom $HOME/dotfiles/oh-my-fish

# Load oh-my-fish configuration.
. $fish_path/oh-my-fish.fish
