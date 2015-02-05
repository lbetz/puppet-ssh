class ssh::server(
  $ensure  = 'running',
  $enable  = true,
  $options = $params::default_sshd_options,
) inherits ssh::params {

  validate_re($ensure, '^(stopped|running)$',
    'Supported values for ensure are stopped and running.')
  validate_bool($enable)
  validate_hash($options)

  $_options = merge($params::default_sshd_options, $options)

  anchor { 'ssh::server::begin':
    notify => Class['service'],
  }
  -> Class['install']
  -> Class['config']
  ~> Class['service']
  -> anchor { 'ssh::server::end': }

  include install, config, service

}
