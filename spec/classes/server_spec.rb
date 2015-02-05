require 'spec_helper'

describe 'ssh::server' do
  let(:facts) { {:osfamily => 'redhat', :concat_basedir => '/tmp'} }

  context 'with defaults for all parameters' do
    it do
      should contain_package('openssh-server')
      should contain_concat('sshd_config').with({
        'path' => '/etc/ssh/sshd_config',
        'mode' => '0600',
      })
      should contain_service('sshd').with({
        'ensure' => 'running',
        'enable' => true,
      })
    end
  end

  context 'on unsupported operatingsystem' do
    let(:facts) { {:osfamily => 'foo'} }
    it do
      expect {
        should contain_class('ssh::server')
      }.to raise_error(Puppet::Error, /is not supported/)
    end
  end

  context 'with ensure => stopped' do
    let(:params) { {:ensure => 'stopped'} }
    it do
      should contain_service('sshd').with({
        'ensure' => 'stopped',
      })
    end
  end

  context 'with ensure => foo (unsuppoerted value)' do
    let(:params) { {:ensure => 'foo'} }
    it do
      expect {
        should contain_service('sshd')
      }.to raise_error(Puppet::Error, /for ensure are stopped and running/)
    end
  end

  context 'with enable => false' do
    let(:params) { {:enable => false} }
    it do
      should contain_service('sshd').with({
        'enable' => false,
      })
    end
  end

  context 'with enable => foo (unsuppoerted value)' do
    let(:params) { {:enable => 'foo'} }
    it do
      expect {
        should contain_service('sshd')
      }.to raise_error(Puppet::Error, /is not a boolean/)
    end
  end

  context 'with options => { PermitRootLogin => no, AllowAgentForwarding => no }' do
    let(:params) { {:options => {
      'PermitRootLogin' => 'no',
      'AllowAgentForwarding' => 'no'}}
    }
    it do
      should contain_ssh__server__option('PermitRootLogin').with({
        'value' => 'no',
      })
      should contain_ssh__server__option('AllowAgentForwarding').with({
        'value' => 'no',
      })
    end
  end

end
