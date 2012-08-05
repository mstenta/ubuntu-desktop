class git::config (
  $user,
  $name,
  $email,
) {

  # Git configuration
  file { "/home/${user}/.gitconfig":
    ensure => present,
    content => template('git/gitconfig.erb'),
    owner => $user,
    group => $user,
    require => Class['git'],
  }
}
