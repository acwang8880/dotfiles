#!/usr/bin/bash

connect() {
    ssh -NfL $2:localhost:$1 cptbirdy@battleship &
    echo -e "Service: $3 \t $1 : $2"
}

if [ "$1" = "check" ]; then
    i=1
    while true; do
            echo "Checking battleship heartbeat"
            echo $i
            ssh cptbirdy@battleship
            i=$((i+1))
            sleep 3s
    done
else
    if [ "$1" == "syncthing" ]; then
        connect 8384 8385 syncthing
    elif [ "$1" == "jupyter" ]; then
        connect 8888 8889 jupyter
    elif [ "$1" == "plex" ]; then
        connect 32400 9999 plex
    elif [ "$1" == "grafana" ]; then
        connect 3000 3001 grafana
    elif [ "$1" == "all" ]; then
        connect 8384 8385 syncthing
        connect 8888 8889 jupyter
        connect 32400 9999 plex
        connect 3000 3001 grafana
    elif [ "$1" == "kill" ]; then
        taskkill -f -im ssh.exe
    fi
    if [ "$2" == "--connect" ] || [ "$1" == "--connect" ]; then
        ssh cptbirdy@battleship
    else
        echo -e "Options:\tcheck\n\t\tsyncthing\n\t\tjupyter\n\t\tplex\n\t\tgrafana\n\t\tall\n\t\tkill\n"
    fi
fi

# ssh 35.141.141.93 -p 23023 # pi
