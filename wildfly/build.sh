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

packer build -var "architecture=${ARCHITECTURE}" \
             -var "jboss_user=${JBOSS_USER}" \
             -var "jboss_pass=${JBOSS_PASS}" \
             packer.json
