Exec { path => "/usr/sbin/:/sbin:/usr/bin:/bin" }
File { owner => 'root', group => 'root' }

node 'default' {

  # Import settings.pp
  import 'settings'

  # Include Puppetlabs modules.
  include stdlib
  include apt

  # Define the apt-get update exec.
  exec { 'apt-get update':
    command => '/usr/bin/apt-get update',
    refreshonly => true,
  }

  # Install essential development packages.
  package { ['build-essential', 'unzip', 'vim']:
    ensure => present,
  }

  # Install and configure Git.
  include git
  class { 'git::config':
    user => $user,
    name => $git_name,
    email => $git_email,
  }

  # Install GitG
  package { 'gitg':
    ensure => present,
    require => Package['git-core'],
  }

  # Install Gnome.
  include gnome

  # Install common Gnome Shell extensions.
  gnome::extension { 'gnome-shell-extensions':
    ppa => 'ricotz/testing',
    require => Class['gnome'],
  }

  # Configure Gnome favorites.
  exec { 'gsettings set org.gnome.shell favorite-apps':
    command => "gsettings set org.gnome.shell favorite-apps \"['nautilus.desktop', 'google-chrome.desktop', 'gedit.desktop', 'gnome-terminal.desktop', 'gitg.desktop', 'gimp.desktop']\"",
    unless => "gsettings get org.gnome.shell favorite-apps | grep -q \"\\['nautilus.desktop', 'google-chrome.desktop', 'gedit.desktop', 'gnome-terminal.desktop', 'gitg.desktop', 'gimp.desktop'\\]\"",
    user => $user,
    require => Class['gnome'],
  }

  # Install Chrome.
  include google-chrome

  # Install Gimp
  package { 'gimp':
    ensure => present,
  }
}
