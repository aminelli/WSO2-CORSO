@echo off

echo "###### AVVIO CONTAINER PGADMIN ######"

docker network create net-wso2

echo "== CREAZIONE CONTAINER POSTGRESQL =="

docker run -d --name postgres-wso2 --hostname postgres-wso2 -e POSTGRES_USER=root -e POSTGRES_PASSWORD=root --network net-wso2 -p 5432:5432 -v vol_wso2_postgresql:/var/lib/postgresql/data -v .\01-init-schemas.sql:/docker-entrypoint-initdb.d/01-init-schemas.sql -v .\02-db-apim-shared.sql:/docker-entrypoint-initdb.d/02-db-apim-shared.sql -v .\03-db-apim.sql:/docker-entrypoint-initdb.d/03-db-apim.sql -v .\04-db-is-shared.sql:/docker-entrypoint-initdb.d/04-db-is-shared.sql -v .\05-db-is-identity.sql:/docker-entrypoint-initdb.d/05-db-is-identity.sql -v .\06-db-is-identity-consent.sql:/docker-entrypoint-initdb.d/06-db-is-identity-consent.sql postgres:latest

echo "###### AVVIO CONTAINER TERMINATO ######"
echo "-> AVVIO Logs"

docker logs -f postgres-wso2
