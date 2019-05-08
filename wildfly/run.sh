#!/bin/bash

docker run -d --restart unless-stopped -p 8080:8080 -p 9990:9990 -v /home/thawes/programs/share/wildfly/deployments/:/opt/jboss/wildfly/standalone/deployments/ -v /home/thawes/programs/share/sword/:/usr/share/sword/ -v /etc/sword.conf:/etc/sword.conf timotheosh/wildfly
