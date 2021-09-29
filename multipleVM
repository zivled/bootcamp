#name of vm to current directory
vm_prefix = "k8s0"
#number of vms
vm_number = 3
#ram
vm_ram = 512
#cpu
vm_cpu = 1

Vagrant.configure("2") do |config|

  config.vm.box = 'hashicorp/bionic64'
  config.vm.synced_folder ".", "/vagrant", disabled: true
  # config.vm.provision "shell", run: "always", inline: "[ -f /etc/udev/rules.d/70-persistent-net.rules ] && rm -fr /etc/udev/rules.d/70-persistent-net.rules"

#   config.ssh.username = 'root'
#   config.ssh.password = 'root'
#   config.ssh.forward_x11 = true

  (1..vm_number).each do |i|
    config.vm.define vm_name = "#{vm_prefix}%01d" % i do |config|
      config.vm.hostname = vm_name
      config.vm.network "private_network", type: "dhcp"
      config.vm.provider :virtualbox do |vb|
        vb.gui = false
        vb.name = vm_name
        vb.linked_clone = false
        vb.memory = vm_ram
        vb.cpus = vm_cpu
      end
    end
  end
end