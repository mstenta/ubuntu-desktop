# ubuntu-desktop

A Puppet script for generating an Ubuntu desktop installation, preconfigured with my preferred software and configuration.

## Features

* Development tools: build-essential, unzip, vim
* Git, GitG, and default user configuration
* Gnome Shell
* Chromium
* Gimp

## Setup

1. git clone https://github.com/mstenta/ubuntu-desktop.git
2. cd ubuntu-desktop
3. Copy default.settings.pp to settings.pp and edit configuration in it.

## Dependencies

* Ubuntu 12.10
* Git
* Puppet 2.7+

