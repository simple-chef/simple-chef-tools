#
# Cookbook Name:: zdg
# Recipe:: wkhtmltopdf
#
# Download and install http://gna.org/projects/wkhtmltopdf
#

# http://tukaani.org/xz/ - alternative compression library, used for installing
package 'xz-utils'

# download archive
remote_file "/tmp/wkhtmltopdf.tar.xz" do
  source 'http://download.gna.org/wkhtmltopdf/0.12/0.12.3/wkhtmltox-0.12.3_linux-generic-amd64.tar.xz'
  owner 'root'
  group 'root'
  mode '0755'
end

# unpack and move to /opt
simple_chef_tools_safebash "unpack wkhtmltopdf" do
  code <<-EOH
    cd /tmp
    tar xf wkhtmltopdf.tar.xz
    mv wkhtmltox /opt
  EOH
end

# symlink to /usr/bin
link '/usr/bin/wkhtmltopdf' do
  to '/opt/wkhtmltox/bin/wkhtmltopdf'
end
