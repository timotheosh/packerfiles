#/bin/bash

ARCH=$(uname -m)

case $ARCH in
  x86_64)
    ARCHITECTURE=amd64
    ;;
  armv7l)
    ARCHITECTURE=arm
    ;;
  *)
    ARCHITECTURE=unknown
    ;;
esac

packer build -var "architecture=${ARCHITECTURE}" packer.json
