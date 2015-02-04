class ssh::server::service {

  private()

  $ensure  = $server::ensure
  $enable  = $server::enable
  $service = $params::sshd_service

  service { $service:
    ensure => $ensure,
    enable => $enable,
  }

}
