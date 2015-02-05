class ssh::client {

  include ssh::params

  $ssh_package = $params::ssh_package

  package { $ssh_package:
    ensure => installed,
  }

}
