# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = "hashicorp/precise64"
  # config.vm.provision :shell, :path => "bootstrap.sh"
  config.vm.network :forwarded_port, guest: 3000, host: 3000
  config.vm.network :forwarded_port, guest: 5432, host: 5432

  config.vm.network :private_network, ip: "192.168.33.10"

  config.vm.provision "chef_solo" do |chef|
    chef.add_recipe "main"
  end

  # The url from where the 'config.vm.box' box will be fetched if it
  # doesn't already exist on the user's system.
  # config.vm.box_url = "https://vagrantcloud.com/hashicorp/precise64/version/2/provider/virtualbox.box"

  config.vm.synced_folder "healfy", "/home/vagrant/healfy"

end
