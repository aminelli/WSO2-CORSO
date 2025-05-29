# CREAZIONE CONTAINER POSTGRES

write-output "###### AVVIO CONTAINER WSO2 API-M All-In-One ######"

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

write-output "== CREAZIONE CONTAINER WSO2 API-M =="

docker run -d `
    --name ws02is `
    --hostname ws02is `
    --network $networkName `
    -p 9453:9453 `
    -p 4010:4010 `
    wso2is:7.1.0

write-output "###### AVVIO CONTAINER TERMINATO ######"
write-output "-> AVVIO Logs"

docker logs -f ws02is
