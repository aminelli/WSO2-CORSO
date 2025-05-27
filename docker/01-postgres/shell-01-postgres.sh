#!/bin/bash

docker network create net-wso2

docker run -d \
    --name postgres-wso2 \
    --hostname postgres-wso2 \
    -e POSTGRES_USER=root \
    -e POSTGRES_PASSWORD=root \
    --network $networkName \
    -p 5432:5432 \
    -v vol_wso2_postgresql:/var/lib/postgresql/data \
    -v .\01-init-schemas.sql:/docker-entrypoint-initdb.d/01-init-schemas.sql \
    -v .\02-db-apim-shared.sql:/docker-entrypoint-initdb.d/02-db-apim-shared.sql \
    -v .\03-db-apim.sql:/docker-entrypoint-initdb.d/03-db-apim.sql \
    postgres:latest 

docker logs -f postgres-wso2
