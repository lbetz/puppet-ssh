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

  $default_sshd_options = {
    'Protocol'                        => '2',
    'SyslogFacility'                  => 'AUTHPRIV',
    'PermitRootLogin'                 => 'yes',
    'PasswordAuthentication'          => 'yes',
    'ChallengeResponseAuthentication' => 'no',
    'GSSAPIAuthentication'            => 'yes',
    'GSSAPICleanupCredentials'        => 'yes',
    'UsePAM'                          => 'yes',
    'AcceptEnv'                       => 'LANG LC_CTYPE LC_NUMERIC LC_TIME LC_COLLATE LC_MONETARY LC_MESSAGES LC_PAPER LC_NAME LC_ADDRESS LC_TELEPHONE LC_MEASUREMENT LC_IDENTIFICATION LC_ALL LANGUAGE XMODIFIERS',
    'X11Forwarding'                   => 'yes',
    'UseDNS'                          => 'no',
  }

  $allowed_sshd_options = [
    '#puppet_rspec',
    'Protocol',
    'SyslogFacility',
    'PermitRootLogin',
    'PasswordAuthentication',
    'ChallengeResponseAuthentication',
    'GSSAPIAuthentication',
    'GSSAPICleanupCredentials',
    'UsePAM',
    'AcceptEnv',
    'X11Forwarding',
    'UseDNS',
    'AllowAgentForwarding',
    'Port',
    'AddressFamily',
    'ListenAddress',
    'HostKey',
    'KeyRegenerationInterval',
    'ServerKeyBits',
    'SyslogFacility',
    'LogLevel',
    'LoginGraceTime',
    'StrictModes',
    'MaxAuthTries',
    'MaxSessions',
    'RSAAuthentication',
    'PubkeyAuthentication',
    'AuthorizedKeysFile',
    'AuthorizedKeysCommand',
    'AuthorizedKeysCommandRunAs',
    'RhostsRSAAuthentication',
    'HostbasedAuthentication',
    'IgnoreUserKnownHosts',
    'IgnoreRhosts',
    'PasswordAuthentication',
    'PermitEmptyPasswords',
    'ChallengeResponseAuthentication',
    'KerberosAuthentication',
    'KerberosOrLocalPasswd',
    'KerberosTicketCleanup',
    'KerberosGetAFSToken',
    'KerberosUseKuserok',
    'GSSAPIAuthentication',
    'GSSAPICleanupCredentials',
    'GSSAPIStrictAcceptorCheck',
    'GSSAPIKeyExchange',
    'UsePAM',
    'AllowTcpForwarding',
    'GatewayPorts',
    'X11Forwarding',
    'X11DisplayOffset',
    'X11UseLocalhost',
    'PrintMotd',
    'PrintLastLog',
    'TCPKeepAlive',
    'UseLogin',
    'UsePrivilegeSeparation',
    'PermitUserEnvironment',
    'Compression',
    'ClientAliveInterval',
    'ClientAliveCountMax',
    'ShowPatchLevel',
    'PidFile',
    'MaxStartups',
    'PermitTunnel',
    'ChrootDirectory',
    'Banner',
  ]

}
