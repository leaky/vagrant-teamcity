Vagrant + TeamCity
===============

Spin up a Vagrant environment that runs TeamCity.

This Vagrantfile uses Parallels as the provider, you can overwrite this as shown in the docs that are available here: https://docs.vagrantup.com/v2/providers/

At the time of composing this script the current stable release of TeamCity is **8.1.5**. Should you use this script and there's a newer version of TeamCity available, modify: **/install.sh:11**

>**Note:**
If `vagrant up` doesn't trigger the modification of the hosts file then run `vagrant hostmanager` to write teamcity to etc/hosts