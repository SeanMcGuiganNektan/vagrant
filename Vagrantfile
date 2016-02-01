# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://atlas.hashicorp.com/search.
  
  # config.vm.box = "puphpet/centos65-x64"
  # config.vm.box =  "ubuntu/trusty64" 
  config.vm.box = "hashicorp/precise64"
  config.vm.boot_timeout = 300

  config.vm.network "private_network", type: "dhcp"
 
  config.hostmanager.enabled = true
  config.hostmanager.ip_resolver = proc do |vm, resolving_vm|
    if vm.id
      `VBoxManage guestproperty get #{vm.id} "/VirtualBox/GuestInfo/Net/1/V4/IP"`.split()[1]
    end
  end

  # config.ssh.username = "admin"

  
  config.vm.define "haproxy01" do |ha01|
    config.vm.hostname = "ha01"
    #  config.vm.network :private_network, ip: "10.0.2.10"
    
    #  config.vm.provision :shell, path: "bootstrap_apache.sh"
    #  config.vm.network :forwarded_port, guest: 80, host: 8080
    
    ha01.vm.provider :virtualbox do |vb|
        vb.customize ["modifyvm", :id, "--memory", "1024"]
        vb.customize ["modifyvm", :id, "--cpus", "2"]
    end
    config.vm.provision "chef_zero" do |chef|
        chef.node_name = "haproxy01"
        # Specify the local paths where Chef data is stored
        chef.cookbooks_path = "./cookbooks"
        chef.data_bags_path = "./data_bags"
        chef.nodes_path = "./nodes"
        chef.roles_path = "./roles"
        # Add a recipe
        chef.add_recipe "haproxy"

        # Or maybe a role
        # chef.add_role "web"
    end
  end

  config.vm.define "webserver01" do |web01|
  config.vm.hostname = "web01"
    # config.vm.network :private_network, ip: "10.0.2.20"
  
    #  config.vm.provision :shell, path: "bootstrap_apache.sh"
    #  config.vm.network :forwarded_port, guest: 80, host: 8080
  
    web01.vm.provider :virtualbox do |vb|
        vb.customize ["modifyvm", :id, "--memory", "1024"]
        vb.customize ["modifyvm", :id, "--cpus", "1"]
    end
    config.vm.provision "chef_zero" do |chef|
        chef.node_name = "web01"
        # Specify the local paths where Chef data is stored
        chef.cookbooks_path = "./cookbooks"
        chef.data_bags_path = "./data_bags"
        chef.nodes_path = "./nodes"
        chef.roles_path = "./roles"
        # Add a recipe
        chef.add_recipe "haproxy"

        # Or maybe a role
        # chef.add_role "web"
    end
  end

   config.vm.define "webserver02" do |web02|
    config.vm.hostname = "web02"
    #  config.vm.network :private_network, ip: "10.0.2.30"
    
    #  config.vm.provision :shell, path: "bootstrap_apache.sh"
    #  config.vm.network :forwarded_port, guest: 80, host: 8080
    
    web02.vm.provider :virtualbox do |vb|
        vb.customize ["modifyvm", :id, "--memory", "1024"]
        vb.customize ["modifyvm", :id, "--cpus", "1"]
    end
    config.vm.provision "chef_zero" do |chef|
        chef.node_name = "web02"
        # Specify the local paths where Chef data is stored
        chef.cookbooks_path = "./cookbooks"
        chef.data_bags_path = "./data_bags"
        chef.nodes_path = "./nodes"
        chef.roles_path = "./roles"
        # Add a recipe
        chef.add_recipe "haproxy"

        # Or maybe a role
        # chef.add_role "web"
    end    
  end

  # config.vm.define "webserver03" do |web03|
  #  config.vm.hostname = "web03"
  #  config.vm.network :private_network, ip: "10.0.2.40"
  #  #  config.vm.provision :shell, path: "bootstrap_apache.sh"
  #  #  config.vm.network :forwarded_port, guest: 80, host: 8080
  #  web03.vm.provider :virtualbox do |vb|
  #      vb.customize ["modifyvm", :id, "--memory", "1024"]
  #      vb.customize ["modifyvm", :id, "--cpus", "1"]
  #    end
  #end

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # config.vm.network "forwarded_port", guest: 80, host: 8080

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  # config.vm.provider "virtualbox" do |vb|
  #   # Display the VirtualBox GUI when booting the machine
  #   vb.gui = true
  #
  #   # Customize the amount of memory on the VM:
  #   vb.memory = "1024"
  # end
  #
  # View the documentation for the provider you are using for more
  # information on available options.

  # Define a Vagrant Push strategy for pushing to Atlas. Other push strategies
  # such as FTP and Heroku are also available. See the documentation at
  # https://docs.vagrantup.com/v2/push/atlas.html for more information.
  # config.push.define "atlas" do |push|
  #   push.app = "YOUR_ATLAS_USERNAME/YOUR_APPLICATION_NAME"
  # end

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
  # config.vm.provision "shell", inline: <<-SHELL
  #   sudo apt-get update
  #   sudo apt-get install -y apache2
  # SHELL
end
