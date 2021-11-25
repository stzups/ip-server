#!/bin/bash
set -e

USER=$1
NAME=$2
VERSION=$3
PASSWORD=$4
REGISTRY=$5

docker build --build-arg CARGO_VERSION="$VERSION" -f ./ci/docker/Dockerfile --tag "$USER/$NAME:$VERSION" .
echo "$PASSWORD" | docker login -u "$USER" --password-stdin
docker push "$REGISTRY/$USER/$NAME:$VERSION"