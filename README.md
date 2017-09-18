# Packer on VMWare for Docker

This is a Debian-based container with Packer installed and VMWare as the
available provider.

VMWare modules and services need to be installed and running on your host.

VT-x will be required if using this image on a VM. In order to use VMWare
this container must be run with the `--privileged` and `--net=host` parameters.
Please be aware of the security implications of this.

The default command is a script that calls 'packer build' for all .json files
in the `/packer` directory.

You should mount your directory containing your Packer project in /packer.

Example:
```
    docker run -t -v ~/my/packer/project:/packer --privileged symbols/packer-vmware
```

