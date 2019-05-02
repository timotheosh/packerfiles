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

if [[ -z ${JBOSS_USER} ]];then
    echo -n "Enter username for Wildfly admin: "
    read JBOSS_USER
    while [[ -z $JBOSS_PASS ]];do
        echo -n "Enter password: "
        read -s pass1
        echo
	echo -n "Re-enter password: "
	read -s pass2
        echo
	if [[ $pass1 = $pass2 ]];then
            JBOSS_PASS=${pass1}
            break
        else
            echo "Passwords do not match!"
        fi
    done
fi

packer build -var "architecture=${ARCHITECTURE}" \
             -var "jboss_user=${JBOSS_USER}" \
             -var "jboss_pass=${JBOSS_PASS}" \
             packer.json
