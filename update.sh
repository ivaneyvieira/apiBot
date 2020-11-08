#!/usr/bin/env bash

git pull --all

./gradlew clean build bootJar

docker-compose down
docker-compose up -d

