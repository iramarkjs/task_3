#!/usr/bin/env bash
echo Building docker-myapp:build

docker build -t docker-myapp:build . -f Dockerfile.build

docker container create --name extract docker-myapp:build

docker container cp extract:/myapp/dist ./app

docker container rm -f extract

echo Building docker-myapp:latest

docker build --no-cache -t docker-myapp:latest .

rm ./app