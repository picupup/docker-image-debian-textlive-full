#!/usr/bin/env bash
# SCRIPT: sync-with-dockerhub.sh 
# AUTHOR: erfan
# DATE: 2024-10-01T02:46:10
# REV: 1.0
# PURPOSE: It creates and uploads the image to docker hub
# set -x # Uncomment to debug
# set -n # Uncomment to check script syntax without execution

# Docker hub user name, please change
user="${2:-picupup}"
tag="${user}/debian-texlive-full"
number="${1:?'Please insert version'}
version="${tag}:${number}"

docker build -t $tag .
docker tag ${tag} ${version}

docker login

docker push ${version}
docker push ${tag}:latest



