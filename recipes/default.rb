#
# Cookbook Name:: groovy
# Recipe:: default
#
# Copyright (C) 2012 Kyle Allan (<kallan@riotgames.com>)
# 
# All rights reserved - Do Not Redistribute
#

if node['platform_family'].eql?('mac_os_x')
  include_recipe 'java-mac'
else
  include_recipe 'java'
end

include_recipe 'ark'

if platform_family?('windows')
  seven_zip_archive "groovy-#{node['groovy']['version']}" do
    path node['groovy']['home']
    source node['groovy']['url']
    checksum node['groovy']['checksum']
    overwrite false
  end

  windows_path ::File.join(node['groovy']['home'], "groovy-#{node['groovy']['version']}", 'bin') do
    action :add
  end
else
  ark "groovy" do
    url node['groovy']['url']
    checksum node['groovy']['checksum']
    home_dir node['groovy']['home']
    version node['groovy']['version']
    append_env_path true unless node['platform_family'].eql?('mac_os_x')
    action :install
  end

  if platform_family?('mac_os_x')
    append_if_no_line "Adding GROOVY_HOME to /etc/profile" do
      path "/etc/profile"
      line "export GROOVY_HOME=#{node['groovy']['home']}"
    end

    file "/etc/paths.d/groovy" do
      content "#{node['groovy']['home']}/bin:"
      mode 0755
    end
  else
    template "/etc/profile.d/groovy_home.sh" do
      mode 0755
      source "groovy_home.sh.erb"
    end
  end
end
