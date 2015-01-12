require 'spec_helper'

describe file('/etc/localtime') do
  it { should contain 'JST' }
end

describe package('java') do
  it { should be_installed }
end

describe package('jetty') do
  it { should be_installed }
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

describe port(80) do
  it { should be_listening }
end
