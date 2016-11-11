# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.box = "centos-7"
  config.vm.synced_folder ".", "/vagrant", disabled: true
  config.vm.network "private_network", type: "dhcp"
  config.vm.provider "virtualbox" do |vb|
    vb.gui = false
    vb.memory = "1024"
  end
  
  config.vm.define "ansible" do |ansible|
    ansible.vm.provision "shell", privileged: true, path: "vagrant/update.sh"
    ansible.vm.provision "shell", privileged: true, path: "vagrant/install_ansible.sh"
    ansible.vm.hostname = "ansible"
    ansible.vm.provider "virtualbox" do |v|
      v.name = "ansible"
    end
  end

  docker_managers = 3
  docker_nodes = 3
  node_prefix = "ansible-"

  (1..docker_managers).each do |i|
    boxname = node_prefix + "dockermgr-0" + i.to_s
    config.vm.define boxname do |mgr|
      mgr.vm.hostname = boxname
      mgr.vm.provision "shell", privileged: true, path: "vagrant/update.sh"
      mgr.vm.provider "virtualbox" do |v|
        v.name = boxname
      end
    end
  end

  (1..docker_nodes).each do |i|
    boxname = node_prefix + "dockernode-0" + i.to_s
    config.vm.define boxname do |node|
      node.vm.hostname = boxname
      node.vm.provision "shell", privileged: true, path: "vagrant/update.sh"
      node.vm.provider "virtualbox" do |v|
        v.name = boxname
      end
    end
  end

end
