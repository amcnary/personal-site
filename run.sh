#!/bin/sh

# Port to use for server, or 8000 by default.
PORT=${1-8000}

# Convenience tag for docker reference.
TAG=app:latest

# Bundle FE code
npm install
npm run build

# Clear old docker images
docker kill $(docker ps -q)

# Build the Docker image
docker build -t $TAG .

# Run the docker image, passing the port and root directory into the
# python script.
docker run -d -p $PORT:$PORT $TAG $PORT

echo Listening at 127.0.0.1:$PORT