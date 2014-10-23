require 'serverspec'
set :backend, :exec

describe "apahce" do
  it "has httpd package installed" do
    expect(package('httpd')).to be_installed
  end

  it "is running the httpd service" do
    expect(service('httpd')).to be_running
  end

  it "has enabled the httpd service" do
    expect(service('httpd')).to be_enabled
  end

  it "is listening on port 80" do
    expect(port(80)).to be_listening
  end

  it "displays our home page" do
    expect(command("curl http://localhost").stdout).to match /ATO/
  end
end
