#!/bin/bash

#docker network create net-wso2

docker run -d \
    --name ws02am \
    --hostname ws02am \
    --network net-wso2 \
    -p 9443:9443 \
    -p 8243:8243 \
    wso2am:4.5.0

docker logs -f ws02am
