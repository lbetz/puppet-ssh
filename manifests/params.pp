class ssh::params {

  case $::osfamily {

    'redhat': {
      $sshd_package = 'openssh-server'
      $sshd_config  = '/etc/ssh/sshd_config'
      $sshd_service = 'sshd'
    }

    default: {
      fail("Your os: $::operatingsystem is not supported, yet.")
    }

  }

}
