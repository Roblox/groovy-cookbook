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
  include_recipe "java"
end

include_recipe "ark"

ark "groovy" do
  url node[:groovy][:url]
  checksum node[:groovy][:checksum]
  home_dir node[:groovy][:home]
  version node[:groovy][:version]
  append_env_path true unless node['platform_family'].eql?('mac_os_x')
  action :install
end

if node['platform_family'].eql?('mac_os_x')
  append_if_no_line "Adding GROOVY_HOME to /etc/profile" do
    path "/etc/profile"
    line "export GROOVY_HOME=#{node[:groovy][:home]}"
  end

  file "/etc/paths.d/groovy" do
    content "#{node[:groovy][:home]}/bin:"
    mode 0755
  end
else
  template "/etc/profile.d/groovy_home.sh" do
    mode 0755
    source "groovy_home.sh.erb"
    variables(:groovy_home => node[:groovy][:home])
  end
end
