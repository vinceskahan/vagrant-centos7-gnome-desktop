# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "centos/7"
  config.vm.provider "virtualbox" do |vb|
    vb.gui = true
    vb.memory = "2048"
    vb.customize "pre-boot", [
       "storageattach", :id,
       "--storagectl", "IDE Controller",
        "--port", "1",
       "--device", "0",
       "--type", "dvddrive",
       "--medium", "emptydrive",
       ]
  end
  config.vm.provision "shell", path: "provision.sh"

end


