#!/usr/bin/env bash

export PATH=$HOME/.bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

. ~/.asdf/asdf.sh

# Setting PATH for Python 3.6
# The original version is saved in .bash_profile.pysave
PATH="${HOME}/.bin:${HOME}/.pyenv/bin:${HOME}/.rbenv/bin:/Library/TeX/texbin:/Library/Frameworks/Python.framework/Versions/3.6/bin:${PATH}"
export PATH

# rbenv ------------------------------------------------------------------- {{{
export PATH="${HOME}/.rbenv/shims:${PATH}"
export RBENV_SHELL=bash
source "${HOME}/.rbenv/libexec/../completions/rbenv.bash"
command rbenv rehash 2>/dev/null
rbenv() {
    local command
    command="${1:-}"
    if [ "$#" -gt 0 ]; then
        shift
    fi

    case "$command" in
        rehash|shell)
            eval "$(rbenv "sh-$command" "$@")";;
        *)
            command rbenv "$command" "$@";;
    esac
}
# /rbenv ------------------------------------------------------------------ }}}

# pyenv ------------------------------------------------------------------- {{{
export PATH="${HOME}/.pyenv/shims:${PATH}"
export PYENV_SHELL=bash
source "${HOME}/.pyenv/libexec/../completions/pyenv.bash"
command pyenv rehash 2>/dev/null
pyenv() {
    local command
    command="$1"
    if [ "$#" -gt 0 ]; then
        shift
    fi

    case "$command" in
        rehash|shell)
            eval "$(pyenv "sh-$command" "$@")";;
        *)
            command pyenv "$command" "$@";;
    esac
}
# /pyenv ------------------------------------------------------------------ }}}
export PATH="${HOME}/.cargo/bin:${PATH}"
source "$HOME/.cargo/env"

. /opt/homebrew/opt/asdf/libexec/asdf.sh
