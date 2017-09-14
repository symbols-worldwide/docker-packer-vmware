#!/bin/bash

for i in *.json
do
  packer build --only=vmware-iso $i
done

