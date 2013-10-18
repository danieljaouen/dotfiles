#!/bin/bash

set -e

# Prerequisites: local SSH server

# Download and install Command Line Tools
xcode-select --install

# Download and install Homebrew
ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)"

# Download and install git
brew install git

# Download and install Python
brew install python --framework --with-brewed-openssl

# Download and install Ansible
brew install ansible

# Download and install Mercurial
pip install mercurial

# Clone down the Ansible repo
git clone git://github.com/danieljaouen/ansible-base-osx.git ~/.ansible.d

# Clone down the Ansible repo
git clone git://github.com/danieljaouen/ansible-base-osx.git ~/.ansible.d

# Provision the box
ansible-playbook -i ~/.ansible.d/osx ~/.ansible.d/site.yml

# Link the casks.
~/.bin/link-casks
