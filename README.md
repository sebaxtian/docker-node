# docker-node
Configuración de Docker para contener aplicaciones que se ejecutan con Node

## Build Contenedor
###### Ver archivo example.env

docker build --build-arg NODE_ENV=production --build-arg DIR_APP=example-app --build-arg PORT_APP=3000 -t sebaxtian/docker-node:1.0.0 .

## Run Contenedor
###### Ver archivo example.env

docker run --name docker-node --env-file $PWD/.env -v $PWD/src/example-app:/home/node/src -p 3000:3000 -d sebaxtian/docker-node:1.0.0

## Restart Contenedor
docker restart docker-node

## Ver logs de Contenedor
docker logs docker-node

## Shell en Contenedor
docker exec -it docker-node bash

## Eliminar Contenedor
docker rm docker-node

## Eliminar Image de Contenedor
docker image rm sebaxtian/docker-node:1.0.0
