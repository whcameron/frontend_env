# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
    config.vm.box = "hashicorp/precise64"
    
    # VM specific configurations
    config.vm.provider "virtualbox" do |v|
        v.memory = 1028
        v.cpus = 1
    end
    
    config.vm.synced_folder ".", "/app"
    config.vm.network :forwarded_port, guest: 80, host: 8080
    
    # Create a private network, which allows host-only access to the machine
    # using a specific IP.
    config.vm.network "private_network", ip: "192.168.10.16"
    
    # Run bootstrap scripts to pull down and build the environment.
    config.vm.provision "shell", :path => "env/bootstrap.sh", run: "always"
end
