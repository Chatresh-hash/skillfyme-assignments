#!/bin/bash
set -e

CONTAINER_NAME="account-srv"
IMAGE_NAME="bank/account-service:v1.0.0"

echo "🧹 Cleaning up old container if it exists..."

# Stop the container if it's running
if [ "$(docker ps -q -f name=$CONTAINER_NAME)" ]; then
    echo "Stopping running container: $CONTAINER_NAME"
    docker stop $CONTAINER_NAME
fi

# Remove the container if it exists (stopped or exited)
if [ "$(docker ps -aq -f name=$CONTAINER_NAME)" ]; then
    echo "Removing old container: $CONTAINER_NAME"
    docker rm $CONTAINER_NAME
fi

echo "🚀 Starting fresh container..."
docker run -d --name $CONTAINER_NAME -p 8080:8080 $IMAGE_NAME
docker run -d --name $CONTAINER_NAME -p 8080:3000 $IMAGE_NAME
