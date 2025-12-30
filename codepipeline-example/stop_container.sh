#!/bin/bash
set -euo pipefail

CONTAINER_NAME="simple-python-flask-app"

if docker ps -a --format '{{.Names}}' | grep -q "^${CONTAINER_NAME}$"; then
  echo "Stopping and removing container: $CONTAINER_NAME"
  docker rm -f "$CONTAINER_NAME"
else
  echo "Container $CONTAINER_NAME not found. Skipping."
fi
