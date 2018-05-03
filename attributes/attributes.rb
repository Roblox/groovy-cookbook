#
# Cookbook Name:: groovy
# Attributes:: default
#
# Copyright (C) 2012 Kyle Allan (<kallan@riotgames.com>)
# 
# All rights reserved - Do Not Redistribute
#

default['groovy']['home']     = platform_family?('windows') ? 'c:\groovy' : '/usr/local/bin/groovy'
default['groovy']['version']  = '2.4.6'
default['groovy']['url']      = 'http://n7-code-repo-vip.disney.private/artifacts/diw-devops/software/groovy/apache-groovy-binary-2.4.6.zip'
default['groovy']['checksum'] = '9b3fb5b51bc21342bba13f090a88ad6d89b20c4a7a166dd50df2ac763c278768'
