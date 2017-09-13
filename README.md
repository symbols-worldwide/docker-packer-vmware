# Packer on VMWare for Docker

This is a Debian-based container with Packer installed and VMWare as the
available provider.

VT-x will be required if using this image on a VM. In order to use VMWare
this container must be run with the --privileged parameter.

The default command is a script that calls 'packer build' for all .json files
in the `/packer` directory.

You should mount your directory containing your Packer project in /packer.

Example:
```
    docker run -t -v ~/my/packer/project:/packer --privileged symbols/packer-virtualbox
```

