@echo off

echo "###### AVVIO CONTAINER PGADMIN ######"

docker network create net-wso2

echo "== CREAZIONE CONTAINER POSTGRESQL =="

docker run -d --name pgadmin-wso2 --hostname pgadmin-wso2 -e PGADMIN_DEFAULT_EMAIL=admin@wso2.com -e PGADMIN_DEFAULT_PASSWORD=admin --network $networkName -p 5050:80 -v vol_wso2_pgadmin:/var/lib/pgadmin dpage/pgadmin4:latest


echo "###### AVVIO CONTAINER TERMINATO ######"
echo "-> AVVIO Logs"

docker logs -f pgadmin-wso2
