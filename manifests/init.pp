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

  # Install Gnome and enable extensions.
  include gnome
  gnome::extension { 'gnome-shell-extensions':
    ppa => 'ricotz/testing',
  }

  # Install Chrome.
  include google-chrome
}
