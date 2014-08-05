# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure("2") do |config|

ENV['VAGRANT_DEFAULT_PROVIDER'] = 'docker'

  config.vm.provider "docker" do |d|

    d.build_dir	= "Docker"
    d.build_args=["-t",  "FTP_image"] 
    d.name="FTP-SERVER"
    
  end

end
