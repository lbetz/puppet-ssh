class ssh::server::install {

  private()

  $package = $params::sshd_package

  package { $package:
    ensure => installed,
  }

}
