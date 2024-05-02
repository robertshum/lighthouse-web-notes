#!/bin/bash
# Variables are populated in github actions

# Stop the current container
echo "Stopping Container: $CONTAINER_NAME"
docker stop $CONTAINER_NAME || true

# Remove the current container (optional, if you want to replace it completely)
echo "Removing Container: $CONTAINER_NAME"
docker rm $CONTAINER_NAME || true

# Pull the latest image from the registry
echo "Getting Latest image from registry: $IMAGE_NAME:$TAG"
docker pull $IMAGE_NAME:$TAG

# Run the updated container with the alias
echo "Starting image: $IMAGE_NAME:$TAG with mappings: $HOST_PORT:$CONTAINER_PORT"
docker run -d --name $CONTAINER_NAME -p $HOST_PORT:$CONTAINER_PORT $IMAGE_NAME:$TAG
