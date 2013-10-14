# Dotfile config

## Install
1. clone this repository
2. cd into the repository
3. run `rake`

## Structure
1. This is probably incredibly obvious, but symlinks (under `locations`)
   indicate the location of the newly-created symlink (relative to `~`).
2. The `topics` directory contains the actual dotfiles.
3. To make directories, use `<dir>.directory.symlink` links (in `locations`).
4. Try not to symlink directories -- instead, create them (with
   `<dir>.directory.symlink` links) and then symlink the dotfiles inside.
