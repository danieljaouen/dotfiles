# Dotfile config

## Install
$ curl https://raw.github.com/danieljaouen/dotfiles/master/topics/bin/bootstrap.sh | bash

## Structure
1. Symlinks (under `locations`) indicate where the soon-to-be-created symlinks
   end up (relative to `~`).
2. The `topics` directory contains the actual dotfiles.
3. To create directories, use `<dir>.directory.symlink` links (under
   `locations`).
4. Try not to symlink directories -- instead, create them (with
   `<dir>.directory.symlink` links) and then symlink dotfiles into them.
