#
# Cookbook Name:: simple-chef-tools
# Resource:: safebash
#

actions :run
default_action :run

attribute :task_name, :name_attribute => true, :kind_of => String, :required => true, :regex => [/^([a-z]|[A-Z]|[0-9]|_| |-|\.)+$/]
attribute :code, :kind_of => String, :required => true

