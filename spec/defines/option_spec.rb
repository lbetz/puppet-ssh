require 'spec_helper'

describe('ssh::server::option', :type => :define) do
  let(:facts) { {:osfamily => 'redhat', :concat_basedir => '/tmp'} }
  let(:title) { '#puppet_rspec' }

  context 'contains class ssh::server' do
    let(:params) { {:value => 'bar'} }
    it do
      should contain_class('ssh::server')
    end
  end

  context 'with title #puppet_rspec' do
    let(:params) { {:value => 'bar'} }
    it do
      should contain_concat__fragment('sshd_config-#puppet_rspec').with({
        'content' => "#puppet_rspec bar\n",
      })
    end
  end

  context 'with title foo and option => #puppet_rspec' do
    let(:title) { 'foo' }
    let(:params) { {:option => '#puppet_rspec', :value => 'bar'} }
    it do
      should contain_concat__fragment('sshd_config-#puppet_rspec').with({
        'content' => "#puppet_rspec bar\n",
      })
    end
  end

  context 'with title foo (unsupported)' do
    let(:title) { 'foo' }
    let(:params) { {:value => 'bar'} }
    it do
      expect {
        should contain_class('ssh:server')
      }.to raise_error(Puppet::Error, /is not validate/)
    end
  end

  context 'with title foo and option => foobaz (unsupported)' do
    let(:title) { 'foo' }
    let(:params) { {:option => 'foobaz', :value => 'bar'} }
    it do
      expect {
        should contain_class('ssh::server')
      }.to raise_error(Puppet::Error, /is not validate/)
    end
  end

end
