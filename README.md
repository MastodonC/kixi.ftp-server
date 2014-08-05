# FTP-server Dockerfile

This project contains the files needed to create a Docker image through Vagrant to run an FTP server on Ubuntu 14.04.

## Dev Environment

+ Install VirtualBox v4.3.8 from [here](https://www.virtualbox.org/wiki/Downloads) or preferably via your OS's package manager.
+ Install Vagrant v. 1.4.3 from [here](http://www.vagrantup.com/) or preferably via your OS's package manager.
+ install the vbguest plugin so Virtual Box guest additions will updated
  for you ``vagrant plugin install vagrant-vbguest``
+ Install Docker. Instructions can be found [here](http://docs.docker.com/installation/).

###Usage

+ ``cd ${PROJECT_HOME}``
+ To start up the virtual machine and FTP to it, run ``/bin/bash startup.sh``
+ The first time it is run, this will download a base image of Ubuntu 14.04 from Docker and then install the required packages on the image. So it will be slow the first time, but after that it will be a lot quicker.
+ You will now have all the services required running in a virtual machine.

If an error occurs, run ``docker logs FTP-SERVER`` for more detailed error messages.

## License

Copyright © 2014 Mastodon C Ltd

Distributed under the Eclipse Public License version 1.0.



