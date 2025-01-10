#!/bin/bash

version="1.1.0"

docker build -t aauren/whoami-with-tools:${version} -t aauren/whoami-with-tools:latest . || exit 1

docker push aauren/whoami-with-tools:${version} || exit 1
docker push aauren/whoami-with-tools:latest || exit 1
