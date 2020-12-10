#!/bin/bash
PS3='Choose command: '
foods=( \
"start docker service"
"start rancher - continue session" \
"zero state" \
"cleanup rancher" \
"Quit" \
)
echo "test:${foods[2]}"
select fav in "${foods[@]}"; do
    case $fav in
        "start docker service")
                echo "Starting docker service"
                sudo systemctl start docker
                break
            ;;
        "start rancher - continue session")
                echo "Starting rancher"
                sudo docker run -d --privileged --restart=unless-stopped --name r-base -p 80:80 -p 443:443 -v /opt/rancher:/var/lib/rancher rancher/rancher:v2.5.3
                break
            ;;
        "cleanup rancher")
                echo "Running cleanup script."
                sudo source cleanup-rancher.sh
                break
            ;;
        "zero state")
                echo "Stoppping all running containers"
                sudo docker stop $(sudo docker ps -aq)
                echo "cleaning /opt/rancher"
                sudo rm -rf /opt/rancher/*
                echo "removing all docker images"
                sudo docker system prune -a
                break
            ;;
	"Quit")
	    echo "User requested exit"
	    exit
	    ;;
        *) echo "invalid option $REPLY";;
    esac
done

