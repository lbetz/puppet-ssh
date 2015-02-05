define ssh::server::option(
  $option = $title,
  $value,
) {

  include ssh::server

  $allowed_sshd_options = $params::allowed_sshd_options

  if !($option in $allowed_sshd_options) {
    fail("${option} is not validate for option.")
  }

  concat::fragment { "sshd_config-${option}":
    target  => 'sshd_config',
    content => "${option} ${value}\n",
    order   => "50",
  }

}
