#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Define variables
DOCKER_COMPOSE_FILE=docker-compose.yml
REMOTE_SERVER=your_remote_server
REMOTE_USER=your_remote_user
REMOTE_PATH=/path/to/your/app

# Build Docker images
echo "Building Docker images..."
docker-compose -f $DOCKER_COMPOSE_FILE build

# Push Docker images to remote server (if using a Docker registry)
echo "Pushing Docker images..."
docker-compose -f $DOCKER_COMPOSE_FILE push

# Deploy application on the remote server
echo "Deploying application to remote server..."
ssh ${REMOTE_USER}@${REMOTE_SERVER} << EOF
    cd ${REMOTE_PATH}
    docker-compose -f $DOCKER_COMPOSE_FILE pull
    docker-compose -f $DOCKER_COMPOSE_FILE up -d --remove-orphans
EOF

echo "Deployment completed."
