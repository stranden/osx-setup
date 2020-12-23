#!/bin/bash 

#Install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

#Minimal dependencies
brew install git
brew install ansible

#Git clone the repo
git clone https://github.com/patrickfnielsen/osx-setup

#Fix ansible localhost warning
export ANSIBLE_LOCALHOST_WARNING=False

if [ -z $(git config --global user.email) ]
then
  echo Enter your e-mail:
  read gitEmail

  echo Enter your name:
  read gitName
fi

#Run ansible playbook
ansible-playbook osx-setup/setup-playbook.yml --extra-vars "git_global_name=$gitName git_global_email=$gitEmail" --ask-become-pass
