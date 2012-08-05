class git {

  # Install Git
  package { 'git-core':
    ensure => present,
  }
}
