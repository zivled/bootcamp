#name of vm for master nodes
master_prefix = "k8s-m-0"
#number of master vms
master_number = 2
#master ram
master_memory = 1024
#master cpu
master_cpu = 2

#name of vm for worker nodes
worker_prefix = "k8s-w-0"
#number of node vms
nodes_number = 3
#worker ram
worker_ram = 512
#worker cpu
worker_cpu = 1

Vagrant.configure("2") do |config|

  config.vm.box = 'hashicorp/bionic64'
  config.vm.synced_folder ".", "/vagrant", disabled: true
  # config.vm.provision "shell", run: "always", inline: "[ -f /etc/udev/rules.d/70-persistent-net.rules ] && rm -fr /etc/udev/rules.d/70-persistent-net.rules"

#   config.ssh.username = 'root'
#   config.ssh.password = 'root'
#   config.ssh.forward_x11 = true

  # Kubernetes Master Server
  (1..master_number).each do |i|
    config.vm.define vm_name = "#{master_prefix}%01d" % i do |config|
      # kmaster.vm.box = "bento/ubuntu-18.04"
      config.vm.hostname = "#{master_prefix}#{i}"
      config.vm.network "private_network", ip: "172.28.128.20#{i}"
      config.vm.provider "virtualbox" do |vb|
        vb.name = "#{master_prefix}#{i}"
        vb.memory = 2048
        vb.cpus = 2
      end
      # kmaster.vm.provision "shell", path: "bootstrap_kmaster.sh"
    end
  end

  (1..nodes_number).each do |i|
    config.vm.define vm_name = "#{worker_prefix}%01d" % i do |config|
      config.vm.hostname = "#{worker_prefix}#{i}"
      config.vm.network "private_network", type: "dhcp"
      config.vm.provider :virtualbox do |vb|
        vb.gui = false
        vb.name = "#{worker_prefix}#{i}"
        vb.linked_clone = false
        vb.memory = vm_ram
        vb.cpus = vm_cpu
      end
    end
  end

  
end