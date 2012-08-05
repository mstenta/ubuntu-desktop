node 'default' {

  # Import settings.pp
  import 'settings'

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
}
