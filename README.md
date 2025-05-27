# WSO2-CORSO




## GitHub

| Desc              | Url                                                  |
| ----------------- | ---------------------------------------------------- |
| GitHub Ufficiale  | https://github.com/orgs/wso2/repositories            |
| GitHub Extensions | https://github.com/orgs/wso2-extensions/repositories |


## Downloads

| Desc  | ver    | Url                                                      |
| ----- | ------ | -------------------------------------------------------- |
| API-M | v4.5.0 | https://github.com/wso2/product-apim/releases/tag/v4.5.0 |


## Link Utili

| Desc       | Url                     |
| ---------- | ----------------------- |
| Docker Hub | https://hub.docker.com/ |
| Portainer | https://docs.portainer.io/start/install-ce?hsCtaAttrib=127816908696 |


### Installazione portainer

```bash
docker volume create portainer_data
docker run -d -p 8001:8000 -p 9943:9443 --name portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:lts
```