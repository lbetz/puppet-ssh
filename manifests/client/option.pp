define ssh::client::option(
  $option = $title,
  $value,
) {

  include ssh::client

  $allowed_ssh_options = $params::allowed_ssh_options

  if !($option in $allowed_ssh_options) {
    fail("${option} is not validate for option.")
  }

  ssh::option { $title:
    option => $option,
    value  => any2array($value),
    target => 'ssh_config',
  }

}
