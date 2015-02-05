class { 'ssh::server':
  options                  =>  {
    'PermitRootLogin'      => 'no',
    'AllowAgentForwarding' => 'no',
  },
}
