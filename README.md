# fuin-dev-setup
Developer setup for projects at fuin.org

## Description
You want to try out some of the projects from this repository? Or want to commit some code?
This respository provides an easy way to setup an Eclipse based environment with all necessary settings like "file encoding", "tab policy", "formatting" or Checkstyle configuration.
It's based on a VMWare or VirtualBox VM environment that is customized with your own user credentials and settings using a simple GUI application.
This allows an easy development setup in a short amount of time and it does not pollute your main operating system.

## Getting started
Provides step-by-step instructions that guide you through the installation process. 

1. Download the [lubuntu-developer-vm](https://github.com/fuinorg/lubuntu-developer-vm)
2. Start the virtual machine and login with the credentials from [lubuntu-developer-vm](https://github.com/fuinorg/lubuntu-developer-vm)
3. Inside the Developer VM download [bootstrap.sh](https://github.com/fuinorg/fuin-dev-setup/blob/master/bootstrap.sh) to your home directory and make it executable
4. Run './bootstrap.sh" and follow the instructions

When everything is successfully installed, a fresh Eclipse JEE installation with the initial [utils4j](https://github.com/fuinorg/utils4j) project should show up.

## Files
Purpose of the main files in this directory

* [bootstrap.sh](bootstrap.sh) - Shell script that is used to bootstrap the installation process (Includes cloning of this directory) 
* [checkstyle-fuin-org.xml](checkstyle-fuin-org.xml) - Current Checkstyle configuration used for all projects
* [eclipse-format-fuin-org.xml](eclipse-format-fuin-org.xml) - Current Eclipse formatter configuration used for all projects
