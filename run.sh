#!/bin/sh

# Port to use for server, or 8000 by default.
PORT=${1-8080}

# Convenience tag for docker reference.
TAG=app:latest

# Clear out old compiled files
rm dist/*

# Bundle FE
npm install
npm run build

# Run AppEngine dev server
dev_appserver.py app.yaml