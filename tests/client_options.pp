class { 'ssh::client':
  options =>  { 'IdentityFile' => ['~/.ssh/identity', '~/.ssh/id_rsa', '~/.ssh/id_dsa'] },
}
