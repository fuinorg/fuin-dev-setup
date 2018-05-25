#!/bin/bash
# Installs project specific setup
set -e

projectDir="$(dirname "$PWD")"

# Basic Setup
mvn exec:java

# Update
export DEBIAN_FRONTEND=noninteractive
export DEBIAN_PRIORITY=critical
sudo -E apt-get -qy update
sudo -E apt-get -qy -o "Dpkg::Options::=--force-confdef" -o "Dpkg::Options::=--force-confold" upgrade
sudo -E apt-get -qy autoclean

# Install additional packages
sudo apt-get install gnome-screenshot
sudo apt-get install gthumb
sudo apt-get install evince

# Install Eclipse
eclipseInstDir=$HOME/eclipse-installer
tar -zxvf $projectDir/files/eclipse-inst-linux64.tar.gz -C $HOME
cp $projectDir/files/eclipse-inst.ini $eclipseInstDir
sed -i "s|\${projectDir}|$projectDir|g" $eclipseInstDir/eclipse-inst.ini
$eclipseInstDir/eclipse-inst

