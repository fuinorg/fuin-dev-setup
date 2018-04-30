#!/bin/bash
# Installs project specific setup
set -e

projectDir="$(dirname "$PWD")"

# Basic Setup
mvn exec:java

# Install additional packages
sudo apt-get install gnome-screenshot

# Install Eclipse
eclipseInstDir=$HOME/eclipse-installer
tar -zxvf $projectDir/files/eclipse-inst-linux64.tar.gz -C $HOME
cp $projectDir/files/eclipse-inst.ini $eclipseInstDir
sed -i "s|\${projectDir}|$projectDir|g" $eclipseInstDir/eclipse-inst.ini
$eclipseInstDir/eclipse-inst

