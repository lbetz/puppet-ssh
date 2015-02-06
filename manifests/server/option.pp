define ssh::server::option(
  $option = $title,
  $value,
) {

  include ssh::server

  $allowed_sshd_options = $params::allowed_sshd_options

  if !($option in $allowed_sshd_options) {
    fail("${option} is not validate for option.")
  }

  ssh::option { $title:
    option => $option,
    value  => any2array($value),
    target => 'sshd_config',
  }

}
