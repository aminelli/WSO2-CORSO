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
    --name ws02am `
    --hostname ws02am `
    --network $networkName `
    -p 9443:9443 `
    -p 8243:8243 `
    wso2am:4.5.0

write-output "###### AVVIO CONTAINER TERMINATO ######"
write-output "-> AVVIO Logs"

docker logs -f ws02am
