# CREAZIONE CONTAINER POSTGRES

write-output "###### AVVIO CONTAINER POSTGRESQL PER DB WSO2ETE ######"

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
    --name postgres-wso2 `
    --hostname postgres-wso2 `
    -e POSTGRES_USER=root `
    -e POSTGRES_PASSWORD=root `
    --network $networkName `
    -p 5432:5432 `
    -v vol_wso2_postgresql:/var/lib/postgresql/data `
    postgres:latest


