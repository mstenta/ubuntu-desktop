class git {

  # Install Git
  package { 'git':
    ensure => present,
  }
}
