# CREAZIONE CONTAINER POSTGRES

write-output "###### AVVIO CONTAINER PGADMIN ######"

$networks = docker network ls --format  "{{.Name}}" 2>$null

$networkName = "net-wso2"

$networkExists = $networks -contains $networkName

write-output "== CREAZIONE RETE =="

if ($networkExists) {
    write-output "Rete già esistente"
} else {
    write-output "Avvio creazione rete docker $networkName"
    docker network create $networkName
}

write-output "== CREAZIONE CONTAINER POSTGRESQL =="

docker run -d `
    --name pgadmin-wso2 `
    --hostname pgadmin-wso2 `
    -e PGADMIN_DEFAULT_EMAIL=admin@wso2.com `
    -e PGADMIN_DEFAULT_PASSWORD=admin `
    --network $networkName `
    -p 5050:80 `
    -v vol_wso2_pgadmin:/var/lib/pgadmin `
    dpage/pgadmin4:latest


write-output "###### AVVIO CONTAINER TERMINATO ######"
write-output "-> AVVIO Logs"

docker logs -f pgadmin-wso2
