class ssh::client(
  $options = {},
) {

  include ssh::params

  $ssh_package         = $params::ssh_package
  $ssh_config          = $params::ssh_config
  $default_ssh_options = $params::default_ssh_options

  $_options = merge($default_ssh_options, $options)

  package { $ssh_package:
    ensure => installed,
  }

  -> concat { 'ssh_config':
    path => $ssh_config,
    mode => '0644',
  }

  concat::fragment { 'ssh_config-header':
    target  => 'ssh_config',
    content => template('ssh/ssh_config-header.erb'),
    order   => '00',
  }

  create_resources('ssh::client::option',
    parseyaml(inline_template(
      '<%= @_options.inject({}) {|h, (x,y)| h[x] = {"option" => x, "value" => y}; h}.to_yaml %>'
  )))

}
