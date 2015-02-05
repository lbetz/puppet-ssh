class ssh::server::config {

  private()

  $sshd_config = $params::sshd_config
  $options     = $server::_options

  concat { 'sshd_config':
    path    => $sshd_config,
    mode    => '0600',
  }

  concat::fragment { 'sshd_config-header':
    target  => 'sshd_config',
    content => template('ssh/sshd_config_header.erb'),
    order   => '00',
  }

  concat::fragment { 'sshd_config-footer':
    target  => 'sshd_config',
    content => template('ssh/sshd_config_footer.erb'),
    order   => '99',
  }

  create_resources('ssh::server::option',
    parseyaml(inline_template(
      '<%= @options.inject({}) {|h, (x,y)| h[x] = {"option" => x, "value" => y}; h}.to_yaml %>'
  )))

}
