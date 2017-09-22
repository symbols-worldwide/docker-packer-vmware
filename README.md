# Packer on VMWare for Docker

This is a Debian-based container with Packer installed and VMWare as the
available provider.

VMWare modules and services need to be installed and running on your host.

VT-x will be required if using this image on a VM. In order to use VMWare
this container must be run with the `--privileged` and `--net=host` parameters.
Please be aware of the security implications of this.

Packer uses the VMWare leases file to determine the guest IP address for SSH. For this you will need to map the DHCP leases file into the container. For example: 

`-v /etc/vmware/vmnet8/dhcpd/dhcpd.leases:/etc/vmware/vmnet8/dhcpd/dhcpd.leases`

Be sure to use the correct vmnet device. By default, vmnet1 is for host-only networking and vmnet8 is for NAT. Packer is unable to determine the guest IP if using bridged networking.

The default command is a script that calls 'packer build' for all .json files
in the `/packer` directory.

You should mount your directory containing your Packer project in /packer.

Example:
```
    docker run -t -v ~/my/packer/project:/packer \
      -v /etc/vmware/vmnet8/dhcpd/dhcpd.leases:/etc/vmware/vmnet8/dhcpd/dhcpd.leases \
      --privileged --net=host symbols/packer-vmware
```

