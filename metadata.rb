name             "groovy"
maintainer       "Antek Baranski"
maintainer_email "antek.baransk@gmail.com"
license          "Apache 2.0"
description      "Installs/Configures groovy"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "1.0.0"

%w(mac_os_x windows centos ubuntu).each do |os|
  supports os
end

depends 'java'
depends 'java-mac'
depends 'ark'
depends 'line'
