node 'default' {

  # Install Git
  package { 'git-core':
    ensure => present
  }
}
