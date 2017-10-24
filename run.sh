#!/bin/bash
docker stop cas &>/dev/null
docker rm cas -f &>/dev/null

cas_version=$1

if [ $# -eq 0 ] || [ -z "$cas_version" ]
  then
    echo "No CAS version is specified."
    read -p "Provide a tag for the CAS image you are about to run (i.e. 5.0.0): " cas_version;
fi

if [ ! -z "$cas_version" ]
  then
	docker run -d --name cas -p 8086:8086 -p 8446:8446 -v /srv/cas/cas-overlay/etc/cas:/cas-overlay/etc/cas steedos/cas steedos/cas:v$cas_version
	docker logs -f cas
  else
  	echo "No image tag is provided."	
fi
