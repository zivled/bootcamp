# prefix for vms
master_prefix = "k8s0"
# number of vms
vm_number = 2
# vm ram
vm_ram = 2048
# vm cpu
vm_cpu = 2

Vagrant.configure("2") do |config|

  config.vm.box = 'bento/ubuntu-18.04'
  config.vm.synced_folder ".", "/vagrant", disabled: true

  (1..vm_number).each do |i|
    config.vm.define vm_name = "#{master_prefix}%01d" % i do |config|
      config.vm.hostname = "#{master_prefix}#{i}"
      config.vm.network "private_network", ip: "172.28.128.20#{i}"
      config.vm.provider "virtualbox" do |vb|
        vb.name = "#{master_prefix}#{i}"
        vb.memory = vm_ram
        vb.cpus = vm_cpu
      end
    end
  end

  config.vm.provision "shell" do |s|
    ssh_pub_key = File.readlines("#{Dir.home}/.ssh/id_rsa.pub").first.strip
    s.inline = <<-SHELL
      echo #{ssh_pub_key} >> /home/vagrant/.ssh/authorized_keys
    SHELL
  end

end