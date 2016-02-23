#
# Cookbook Name:: simple-chef-tools
# Recipe:: prepare-safebash
#

# create directory to store safe_bash locks
directory node['simple-chef-tools']['safebash']['lockdir'] do
  action :create
end
