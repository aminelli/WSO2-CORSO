# WSO2-CORSO

## Dashboards

| Dashboard               | SRV             | URL                                   |
| ----------------------- | --------------- | ------------------------------------- |
| Publisher               | API Manager     | https://localhost:9443/publisher/apis |
| Dev Portal              | API Manager     | https://localhost:9443/devportal      |
| Admin Portal            | API Manager     | https://localhost:9443/admin          |
| API Manager (OLD)       | API Manager     | https://localhost:9443/carbon         |
| Identity Server Console | Identity Server | https://localhost:9453/console        |
| Identity Server Carbon  | Identity Server | https://localhost:9453/carbon/        |


## GitHub

| Desc              | Url                                                  |
| ----------------- | ---------------------------------------------------- |
| GitHub Ufficiale  | https://github.com/orgs/wso2/repositories            |
| GitHub Extensions | https://github.com/orgs/wso2-extensions/repositories |
| Helm x WSO2       | https://github.com/wso2/helm-apim                    |
| Kube x APIM       | https://github.com/wso2/kubernetes-apim              |
| Kube x IS         | https://github.com/wso2/kubernetes-is                |



## Downloads

| Desc         | ver      | Url                                                       |
| ------------ | -------- | --------------------------------------------------------- |
| API-M        | v4.5.0   | https://github.com/wso2/product-apim/releases/tag/v4.5.0  |
| Docker API-M |          | https://github.com/wso2/docker-apim                       |
| Docker API-M | v4.5.0.1 | https://github.com/wso2/docker-apim/releases/tag/v4.5.0.1 |


## Link Utili

| Desc                         | Url                                                                 |
| ---------------------------- | ------------------------------------------------------------------- |
| Docker Hub                   | https://hub.docker.com/                                             |
| Portainer                    | https://docs.portainer.io/start/install-ce?hsCtaAttrib=127816908696 |
| Container Registry uff. wso2 | https://docker.wso2.com/                                            |
| Kubernetes                   | https://kubernetes.io/                                              |
| Kubernetes for learn         | https://kubernetes.io/docs/tasks/tools/                             |



### Installazione portainer

```bash
docker volume create portainer_data
docker run -d -p 8001:8000 -p 9943:9443 --name portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:lts
```


### Note:

#### Privilegi powershell

Per risolvere il problema di powershell relativo all'abilitazione dell'esecuzione di script, lanciare un powershell con diritti amministrativi ed eseguire il comando:

```powershell
Set-ExecutionPolicy RemoteSigned -Scope LocalMachine
```
