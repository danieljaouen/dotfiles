#!/usr/bin/env bash

export PATH=$HOME/.bin:$HOME/.pyenv/bin:$HOME/.rbenv/bin:/Library/TeX/texbin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

. ~/.asdf/asdf.sh

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
