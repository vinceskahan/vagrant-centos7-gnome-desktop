# -*- mode: ruby -*-
# vi: set ft=ruby :

# this assumes you're imported the upstream box from centos into VirtualBox
# see the readme file for how...

Vagrant.configure(2) do |config|
  config.vm.box = "centos/7-1509"
  config.vm.provider "virtualbox" do |vb|
    vb.gui = true
    vb.memory = "1024"
    vb.customize "pre-boot", [
          "storageattach", :id,
          "--storagectl", "IDE Controller",
           "--port", "1",
          "--device", "0",
          "--type", "dvddrive",
          "--medium", "emptydrive",
          ]
    vb.customize ["modifyvm", :id, "--clipboard",   "bidirectional"]
    vb.customize ["modifyvm", :id, "--draganddrop", "bidirectional"]

  end
  config.vm.provision "shell", path: "provision.sh"
end
