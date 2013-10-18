#!/bin/bash

set -e

# Prerequisites: local SSH server

# Download and install Command Line Tools
xcode-select --install

# Download and install Homebrew
ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)"

# Modify the PATH
export PATH=/usr/local/bin:$PATH

# Download and install git
brew install git

# Download and install Python
brew install python --framework --with-brewed-openssl

# Download and install Mercurial
pip install mercurial

# Make the code directory
mkdir -p ~/src

# Download and install Ansible
git clone -b brew git://github.com/danieljaouen/ansible.git ~/src/ansible

# Use the forked Ansible
source ~/src/ansible/hacking/env-setup

# Clone down the Ansible repo
git clone git://github.com/danieljaouen/ansible-base-osx.git ~/.ansible.d

# Clone down the Ansible repo
git clone git://github.com/danieljaouen/ansible-base-osx.git ~/.ansible.d

# Provision the box
ansible-playbook -i ~/.ansible.d/osx ~/.ansible.d/site.yml

# Link the casks.
~/.bin/link-casks
