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

  # Install and configure Git.
  include git
  class { 'git::config':
    user => $user,
    name => $git_name,
    email => $git_email,
  }

  # Install Gnome.
  include gnome

  # Install Chrome.
  include google-chrome
}
