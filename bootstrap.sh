#!/bin/bash
# Bootstraps personalization of the developer's environment
set -e

# Project specific variables - Those four are the only ones that
# need to be adjusted while copying this script to a new project
gitHost="github.com"
gitUser="fuinorg"
gitRepo="fuin-dev-setup"
sshPrvKey=""
sshDir=~/.ssh
sshConfigFile=$sshDir/config

if [[ -z "$sshPrvKey" ]]; then
    echo "Bootstrapping from public repository"
    fullRepoUrl=https://$gitHost/$gitUser/$gitRepo.git
else
    echo "Bootstrapping from private repository"
    fullRepoUrl=git@$gitHost:$gitUser/$gitRepo.git

    # Define dependent variables
    sshPrvKeyDir=$sshDir/$gitHost/$gitUser
    sshPrvKeyFile=$sshPrvKeyDir/$gitRepo

    # Save private key
    mkdir -p $sshPrvKeyDir
    echo "$sshPrvKey" >> $sshPrvKeyFile

    # Only owner can access private key
    chmod 600 $sshPrvKeyFile

    # Adds new SSH keys to config
    echo "Host $gitHost" >> $sshConfigFile
    echo "    User git" >> $sshConfigFile
    echo "    HostName $gitHost" >> $sshConfigFile
    echo "    IdentityFile $sshPrvKeyFile" >> $sshConfigFile
    echo "" >> $sshConfigFile
fi

# Create base directory
mkdir -p ~/git
cd ~/git

# Clone the repo
echo "Start cloning from $fullRepoUrl"
git clone $fullRepoUrl

# Remove temporary config file
if [ -f $sshConfigFile ] ; then
    rm $sshConfigFile
fi

# Start installation
cd $gitRepo/project
chmod +x setup.sh
./setup.sh

