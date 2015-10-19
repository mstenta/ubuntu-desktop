# ubuntu-desktop

A Puppet script for provisioning an Ubuntu 14.04 desktop workstation.

## Setup

1. sudo apt-get install git puppet
2. git clone https://github.com/mstenta/ubuntu-desktop.git
3. cd ubuntu-desktop
4. Copy manifests/default.settings.pp to manifests/settings.pp and edit configuration in it.
5. ./run

## Features

* Development tools: build-essential, unzip, vim, gedit-plugins, nautilus-open-terminal
* Git, GitG, and default user configuration
* Gnome Shell
* Chromium
* MySQL Workbench
* Gimp
* KeePassX
* Pidgin
* Virtual Box
* Vagrant

