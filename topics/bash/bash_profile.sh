#!/usr/bin/env bash

export PATH=$HOME/.bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

# Setting PATH for Python 3.6
# The original version is saved in .bash_profile.pysave
PATH="${HOME}/.bin:${HOME}/.pyenv/bin:${HOME}/.rbenv/bin:/Library/Frameworks/Python.framework/Versions/3.6/bin:${PATH}"
export PATH

# rbenv:
export PATH="/Users/dan/.rbenv/shims:${PATH}"
export RBENV_SHELL=bash
source '/Users/dan/.rbenv/libexec/../completions/rbenv.bash'
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
