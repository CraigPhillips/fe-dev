# -*- mode: ruby -*-
# vi: set ft=ruby :
  
$awscrd = "~/.aws/credentials"
$awscrds = "/tmp/.aws/credentials"
$awscfg = "~/.aws/config"
$awscfgs = "/tmp/.aws/config"
$sshkey = "~/.ssh/id_rsa"
$sshkeys = "/tmp/id_rsa"
$gitkey= "~/.gitconfig"
$gitkeys= "/tmp/.gitconfig"

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
#
# For a complete reference, please see the online documentation at
# https://docs.vagrantup.com.
Vagrant.configure("2") do |config|

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://atlas.hashicorp.com/search.
  
  # Desktop Ubuntu 16.04.1 (Xenial Xerus, LTS - EoL: July 21, 2021)
  config.vm.box = "box-cutter/ubuntu1604-desktop"
  config.vm.box_check_update = true

  # Parameters for the environment being created
  config.vm.provider "virtualbox" do |vb|
    vb.customize ["modifyvm", :id, 
      "--memory", "4096", 
      "--cpus", "2",
      "--monitorcount", "2"
    ]
  end

  # Shares SSH keys with guest
  config.vm.provision "file", source: $sshkey, destination: $sshkeys

  # Shares Git config with guest
  config.vm.provision "file", source: $gitkey, destination: $gitkeys

  # Shares AWS settings with guest
  config.vm.provision "file", source: $awscrd, destination: $awscrds
  config.vm.provision "file", source: $awscfg, destination: $awscfgs

  # Maps local user directory to guest folder for easy file transfer
  config.vm.synced_folder "~", "/host-home"

  # Run Ansible from the Vagrant VM
  config.vm.provision "ansible_local" do |ansible|
    ansible.galaxy_role_file = "required-roles.yaml"
    ansible.provisioning_path = "/vagrant/ansible"
    ansible.playbook = "playbook.yaml"
    ansible.verbose = true
  end
end