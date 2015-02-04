class ssh::server::config {

  private()

  $sshd_config = $params::sshd_config

  file { $sshd_config:
    ensure  => file,
    mode    => '0600',
    content => template('ssh/sshd_config.erb'),
  }

}
