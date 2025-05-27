# WSO2-CORSO




## GitHub

| Desc              | Url                                                  |
| ----------------- | ---------------------------------------------------- |
| GitHub Ufficiale  | https://github.com/orgs/wso2/repositories            |
| GitHub Extensions | https://github.com/orgs/wso2-extensions/repositories |


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
