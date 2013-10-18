#!/bin/bash

set -e

SRC_DIRECTORY="$HOME/src"
ANSIBLE_DIRECTORY="$SRC_DIRECTORY/ansible"
ANSIBLE_CONFIGURATION_DIRECTORY="$HOME/.ansible.d"

# Prerequisites: local SSH server

# Download and install Command Line Tools
if [[ ! -x /usr/bin/gcc ]]; then
    echo "Info   | Install   | xcode"
    xcode-select --install
fi

# Download and install Homebrew
if [[ ! -x /usr/local/bin/brew ]]; then
    echo "Info   | Install   | homebrew"
    ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)"
fi

# Modify the PATH
export PATH=/usr/local/bin:$PATH

# Download and install zsh
if [[ ! -x /usr/local/bin/zsh ]]; then
    echo "Info   | Install   | zsh"
    brew install zsh
fi

# Download and install git
if [[ ! -x /usr/local/bin/git ]]; then
    echo "Info   | Install   | git"
    brew install git
fi

# Download and install python
if [[ ! -x /usr/local/bin/python ]]; then
    echo "Info   | Install   | python"
    brew install python --framework --with-brewed-openssl
fi

# Download and install hg
if [[ ! -x /usr/local/bin/hg ]]; then
    pip install mercurial
fi

# Make the code directory
mkdir -p $SRC_DIRECTORY

# Clone down ansible
if [[ ! -d $ANSIBLE_DIRECTORY ]]; then
    git clone -b brew git://github.com/danieljaouen/ansible.git $ANSIBLE_DIRECTORY
fi

# Check out the 'brew' branch
(cd $ANSIBLE_DIRECTORY && git checkout brew)

# Use the forked Ansible
source $ANSIBLE_DIRECTORY/hacking/env-setup

# Clone down the Ansible repo
if [[ ! -d $ANSIBLE_CONFIGURATION_DIRECTORY ]]; then
    git clone git://github.com/danieljaouen/ansible-base-osx.git $ANSIBLE_CONFIGURATION_DIRECTORY
fi

# Provision the box
ansible-playbook -i $ANSIBLE_CONFIGURATION_DIRECTORY/inventories/osx $ANSIBLE_CONFIGURATION_DIRECTORY/site.yml

# Link the casks.
~/.bin/link-casks