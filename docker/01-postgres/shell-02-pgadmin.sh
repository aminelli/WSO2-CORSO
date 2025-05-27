#!/bin/bash

docker network create net-wso2

docker run -d \
    --name pgadmin-wso2 \
    --hostname pgadmin-wso2 \
    -e PGADMIN_DEFAULT_EMAIL=admin@wso2.com \
    -e PGADMIN_DEFAULT_PASSWORD=admin \
    --network $networkName \
    -p 5050:80 \
    -v vol_wso2_pgadmin:/var/lib/pgadmin \
    dpage/pgadmin4:latest

docker logs -f pgadmin-wso2
