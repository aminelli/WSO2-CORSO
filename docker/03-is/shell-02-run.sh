#!/bin/bash

#docker network create net-wso2

docker run -d \
    --name ws02is \
    --hostname ws02is \
    --network net-wso2 \
    -p 9453:9453 \
    -p 4010:4010 \
    wso2is:7.1.0

docker logs -f ws02is
