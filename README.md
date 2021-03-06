# fuin-dev-setup
**Developer setup for projects at fuin.org (VM based with Eclipse)**

## Description
You want to try out some of the projects from this repository? Or want to commit some code?
This respository provides an easy way to setup an Eclipse based environment with all necessary settings like "file encoding", "tab policy", "formatting" or Checkstyle configuration.
It's based on a VMWare or VirtualBox VM environment that is customized with your own user credentials and settings using a simple GUI application.
This allows an easy development setup in a short amount of time and it does not pollute your main operating system.

## Requirements
* **Minimal:** Intel Core i5, 8 GB RAM, 128 GB SSD
* **Recommended:** Intel Core i7, 16 GB RAM, 256 GB SSD

## Getting started
Provides step-by-step instructions that guide you through the installation process. 

1. Download the [lubuntu-developer-vm](https://github.com/fuinorg/lubuntu-developer-vm)
2. Start the virtual machine and login with the credentials from [lubuntu-developer-vm](https://github.com/fuinorg/lubuntu-developer-vm)
2. **WORKAROUND** Currently [OpenJFX-11 does not work with OpenJDK-8](https://bugs.launchpad.net/ubuntu/+source/openjfx/+bug/1799946)). To fix this you need to install a downgraded version of OpenJFX in the Lubuntu VM: 
    ```
    sudo apt install openjfx=8u161-b12-1ubuntu2 libopenjfx-java=8u161-b12-1ubuntu2 libopenjfx-jni=8u161-b12-1ubuntu2
    sudo apt-mark hold openjfx libopenjfx-java libopenjfx-jni
    ```
3. Inside the Developer VM save [bootstrap.sh](https://raw.githubusercontent.com/fuinorg/fuin-dev-setup/master/bootstrap.sh) to your home directory and make it executable
   * Open the File Manager and in the properties of the file select "Permissions / Access Control / Execute: Only Owner)" 
4. Run './bootstrap.sh" and follow the instructions
   * Open a terminal with CTRL+ALT+T and type "./bootstrap.sh" followed by ENTER
   * The installation UI will show up
   * When the UI is closed, you need to enter your "developer" password once at the console for some "sudo" operations (It's "developer" if you haven't changed it) 

When everything is successfully installed, a fresh Eclipse JEE installation with the initial [utils4j](https://github.com/fuinorg/utils4j) project should show up.

**Tip:** Set your date/time zone 
```timedatectl set-timezone "Europe/Berlin"```
(Logout+Login required to see changed clock)

## Files
Purpose of the main files in this directory

* [bootstrap.sh](bootstrap.sh) - Shell script that is used to bootstrap the installation process (Includes cloning of this directory) 
* [eclipse-format-fuin-org.xml](eclipse-format-fuin-org.xml) - Current Eclipse formatter configuration used for all projects
