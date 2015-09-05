require 'spec_helper'

httpd, php = /redhat/i =~ os[:family] ? ["httpd", "php"]
                                      : ["apache2", "php5"]

[httpd, php].each do |pkg|
  describe package(pkg) do
    it { should be_installed }
  end
end

describe service(httpd) do
  it { should be_enabled }
  it { should be_running }
end

describe process(httpd) do
  it { should be_running }
end

describe port(80) do
  it { should be_listening }
end

describe command("curl -LI http://localhost/index.php") do
  its(:stdout) { should contain("HTTP/1.1 200 OK") }
end

describe command("curl http://localhost/index.php") do
  its(:stdout) { should contain("<h1>Web Test</h1>") }
end
