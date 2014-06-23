# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "gitprep-vagrant-vm"
  config.vm.box_url = "http://opscode-vm-bento.s3.amazonaws.com/vagrant/virtualbox/opscode_centos-6.5-i386_chef-provisionerless.box"

  # network config
  config.vm.network :private_network, ip: "192.168.55.5"
  config.vm.hostname = "gitprep-vagrant-vm"

  # enable omnibus
  config.omnibus.chef_version = :latest

  # chef solo provisioning
  config.vm.provision :chef_solo do |chef|
    chef.custom_config_path = "Vagrantfile.chef"
    chef.cookbooks_path = ["site-cookbooks"]
    chef.run_list = [
        "recipe[gitprep::default]"
    ]
  end
end
