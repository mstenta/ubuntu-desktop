Exec { path => "/usr/sbin/:/sbin:/usr/bin:/bin" }
File { owner => 'root', group => 'root' }

node 'default' {

  # Import settings.pp
  import 'settings'

  # Define the apt-get update exec.
  exec { 'apt-get update':
    command => '/usr/bin/apt-get update',
    refreshonly => true,
  }

  # Install essential development packages.
  package { ['build-essential', 'unzip', 'vim']:
    ensure => present,
  }

  # Install Nautilus "Open in terminal".
  package { 'nautilus-open-terminal':
    ensure => present,
  }

  # Install gedit plugins.
  package { 'gedit-plugins':
    ensure => present,
  }

  # Install and configure Git.
  include git
  class { 'git::config':
    user => $user,
    name => $git_name,
    email => $git_email,
  }

  # Install GitG.
  package { 'gitg':
    ensure => present,
    require => Package['git'],
  }

  # Install Gnome Shell.
  package { 'gnome-shell':
    ensure => present,
  }

  # Install Chromium.
  package { 'chromium-browser':
    ensure => present,
  }

  # Install MySQL Workbench.
  package { 'mysql-workbench':
    ensure => present,
  }

  # Install Gimp.
  package { 'gimp':
    ensure => present,
  }

  # Install KeePassX.
  package { 'keepassx':
    ensure => present,
  }

  # Install Pidgin.
  package { 'pidgin':
    ensure => present,
  }

  # Install Virtual Box.
  # This has been disabled because apt-get install does not work with Ubuntu
  # 14.04 + kernel 3.19. Install VirtualBox via the official .deb file instead.
  #package { 'virtualbox':
  #  ensure => present,
  #}

  # Install Vagrant.
  package { 'vagrant':
    ensure => present,
  }

  # Install Parcellite.
  package { 'parcellite':
    ensure => present,
  }
}

