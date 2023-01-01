# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "danielr1996/ansible-terraform"
  config.vm.synced_folder "./", "/home/vagrant/project", :mount_options => ["fmode=700"]
  config.vm.synced_folder "~/.kube", "/home/vagrant/.kube", :mount_options => ["fmode=700"]
  config.ssh.extra_args = ["-t", "cd /home/vagrant/project; bash --login"]
  config.vm.provision "shell", run: "always", inline: <<SHELL
  # !IMPORTANT! specify the location to your terraform folder that includes terraform.tfstate
  echo "export ANSIBLE_TF_DIR=/home/vagrant/project/terraform" > /etc/profile.d/env.sh
SHELL
end
