Vagrant.configure("2") do |config|
    config.vm.box = "parallels/ubuntu-12.04"
    config.vm.network :private_network, ip: "192.168.13.37"
    config.vm.hostname = "teamcity"
    config.hostmanager.enabled = true
    config.hostmanager.manage_host = true
    config.vm.provision :shell, :path => "install.sh"
end
