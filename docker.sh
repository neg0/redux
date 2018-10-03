#!/bin/bash
runDockerContainer() {
    output=`uname -a`
    echo "Building and running the node container";
    if [[ output = *"darwin"* ]]; then
        docker-compose -f docker/docker-compose.mac.yml up -d --remove-orphans
        docker-compose -f docker/docker-compose.mac.yml exec node_redux bash
    else
        docker-compose -f docker/docker-compose.yml up -d --remove-orphans
        docker-compose -f docker/docker-compose.yml exec node_redux bash
    fi
}
shutdownDockerContainer() {
    output=`uname -a`
    echo "Shutting down the container";
    if [[ output = *"darwin"* ]]; then
        docker-compose -f docker/docker-compose.mac.yml down
    else
        docker-compose -f docker/docker-compose.yml down
    fi
}
echo "Initialising Docker Script...";
case "$1" in
    up)
        runDockerContainer;
        ;;

    down)
        shutdownDockerContainer;
        ;;
    *)
    echo $"Usage: $0 {up|down}"
    exit 1
esac
