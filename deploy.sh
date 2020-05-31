#!/bin/sh

# Clear out old compiled files
rm dist/*

# Bundle FE
npm install
npm run build

# Deploy via gcloud
gcloud app deploy app.yaml