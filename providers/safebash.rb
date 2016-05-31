#
# Cookbook Name:: simple-chef-tools
# Provider:: safebash
#

require 'zlib'

def whyrun_supported?
  true
end

use_inline_resources

action :run do
  codetorun = new_resource.code.sub('\"', '"')
  codetorun = codetorun.sub('\n','')
  taskname = new_resource.task_name.sub(' ','_')
  # generate file name from hash of the command
  filename = taskname + Zlib.crc32(codetorun).to_s

  bash new_resource.task_name do
    code <<-EOH
      set -e
      #{codetorun}
      touch #{node['simple-chef-tools']['safebash']['lockdir']}/#{filename}
    EOH
    not_if do ::File.exists?( node['simple-chef-tools']['safebash']['lockdir'] + "/" + filename) end
  end
end


#  check if the file exists
# run the command provided
# create the file


# ## todo
# load_current_resource ? http://dougireton.com/blog/2013/01/07/creating-an-lwrp-part-2/
# check if the code provided actually executed ...

#       echo "#{codetorun} #{Zlib.crc32(codetorun).to_s}" >> #{node['simple-chef-tools']['safebash']['lockdir']}/hashtest