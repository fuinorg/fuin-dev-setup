#!/bin/bash
# Bootstraps personalization of the developer's environment
set -e

# Project specific variables - Those four are the only ones that
# need to be adjusted while copying this script to a new project
gitHost="github.com"
gitUser="fuinorg"
gitRepo="fuin-dev-setup"
sshPrvKey=""

if [[ -z "$sshPrvKey" ]]; then
    echo "Bootstrapping from public repository"
else
    echo "Bootstrapping from private repository"

    # Define dependent variables
    sshDir=~/.ssh
    sshConfigFile=$sshDir/config
    sshPrvKeyDir=$sshDir/$gitHost/$gitUser
    sshPrvKeyFile=$sshPrvKeyDir/$gitRepo

    # Save private key
    mkdir -p $sshPrvKeyDir
    echo "$sshPrvKey" >> $sshPrvKeyFile

    # Only owner can access private key
    chmod 600 $sshPrvKeyFile

    # Adds new SSH keys to config
    echo "Host $gitRepo" >> $sshConfigFile
    echo "    User git" >> $sshConfigFile
    echo "    HostName $gitHost" >> $sshConfigFile
    echo "    IdentityFile $sshPrvKeyFile" >> $sshConfigFile
    echo "" >> $sshConfigFile
fi

# Create base directory
mkdir -p ~/git
cd ~/git

# Clone the repo
echo "Start cloning from git@$gitRepo:$gitUser/$gitRepo.git"
git clone git@$gitRepo:$gitUser/$gitRepo.git

# Start installation
cd $gitRepo/project
chmod +x setup.sh
./setup.sh

