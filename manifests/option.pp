define ssh::option(
  $value,
  $target,
  $option = $title,
) {

  private()

  validate_array($value)

  concat::fragment { "${target}-${option}":
    target  => $target,
    content => template('ssh/option.erb'),
    order   => "50",
  }

}
