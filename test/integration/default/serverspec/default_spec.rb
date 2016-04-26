require 'serverspec'
set :backend, :exec

describe command('/usr/local/bin/groovy --version') do
  its(:stdout) { should contain('2.4.6') }
end