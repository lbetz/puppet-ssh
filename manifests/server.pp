class ssh::server(
  $ensure = 'running',
  $enable = true,
) inherits ssh::params {

  validate_re($ensure, '^(stopped|running)$',
    'Supported values for ensure are stopped and running.')
  validate_bool($enable)

  Class['install']
  -> Class['config']
  ~> Class['service']

  include install, config, service

}
