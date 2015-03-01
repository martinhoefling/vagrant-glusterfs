# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/trusty64"
#  config.vm.network "public_network"

  config.vm.provider "virtualbox" do |vb|
    vb.gui = false
    vb.cpus = 1
    vb.memory = "1024"
  end

  config.vm.provision "shell", path: "bootstrap.sh"

  (1..3).each do |i|
    config.vm.define "gluster#{i}" do |hostconfig|
      hostconfig.vm.hostname = "gluster#{i}"
      hostconfig.vm.network "private_network", ip: "192.168.1.#{i+100}"
      hostconfig.vm.provider "virtualbox" do |vb|
        unless File.exist?("gluster_storage#{i}.vdi")
          vb.customize ['createhd', '--filename', "gluster_storage#{i}", '--size', 1 * 1024]
        end
        vb.customize ['storageattach', :id, '--storagectl', 'SATAController', '--port', 1, '--device', 0, '--type', 'hdd', '--medium', "gluster_storage#{i}.vdi"]
        vb.name = "gluster#{i}"
      end
    end
  end
end

