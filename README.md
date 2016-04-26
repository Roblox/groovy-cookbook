# groovy cookbook

# Requirements

Platform:

CentOS 6.x
CentOS 7.x
Ubuntu 12.x
Ubuntu 14.x
Mac OS X 10.10+
Windows SRV 2012R2

The following cookbooks are dependencies:

* Java - Groovy requires the JVM to work.
* ark - Used to unpack and install the Groovy tarball.
* line - Used to modify /etc/profile on Mac OS X

# Usage

Simply include the recipe where you want Groovy to be installed

# Attributes

* default['groovy']['version'] defaults to 2.4.6
* default['groovy']['home'] defaults to /usr/local/groovy
* default['groovy']['url'] the download url for the groovy binary zip
* default['groovy']['checksum'] the checksum for the groovy binary zip downloaded in the url

# Recipes

default

# Author

Author:: Antek Baranski (<antek.baranski@gmail.com>)
Author:: Kyle Allan (<kallan@riotgames.com>)
