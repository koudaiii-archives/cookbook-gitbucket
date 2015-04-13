require 'spec_helper'

# TimeZone 
describe command('date'),:if => os[:family] == 'centos'  do
  its(:stdout) { should eq /JST/ }
end

describe command('/usr/bin/java -version') do
  its(:exit_status) { should eq 0 }
end

describe service('postfix') do
  it { should be_enabled }
end

describe service('jetty') do
  it { should be_enabled }
end

describe package('nginx') do
  it { should be_installed }
end

describe service('nginx') do
  it { should be_enabled }
end

describe file('/opt/jetty/webapps/gitbucket.war') do
  it { should be_file }
end

describe port(443) do
    it { should be_listening }
end
