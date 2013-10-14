# Dotfile config

## Install
1. clone this repository
2. cd into the repository
3. run `rake`

## Structure
1. Symlinks (under `locations`) indicate where the soon-to-be-created symlinks
   end up (relative to `~`).
2. The `topics` directory contains the actual dotfiles.
3. To create directories, use `<dir>.directory.symlink` links (under
   `locations`).
4. Try not to symlink directories -- instead, create them (with
   `<dir>.directory.symlink` links) and then symlink dotfiles into them.
