node 'default' {

  # Import settings.pp
  import 'settings'

  # Install and configure Git.
  include git
  class { 'git::config':
    user => $user,
    name => $git_name,
    email => $git_email,
  }
}
