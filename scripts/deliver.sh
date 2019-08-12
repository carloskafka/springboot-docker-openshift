#!/usr/bin/env bash

docker login

echo "docker build . -t carloskafka7/springboot-docker"
docker build . -t carloskafka7/springboot-docker 

echo "docker push carloskafka7/springboot-docker"
docker push carloskafka7/springboot-docker
