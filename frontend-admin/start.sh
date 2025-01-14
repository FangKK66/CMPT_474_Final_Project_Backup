#!/bin/bash
PROJECT_ID=cmpt-474-project-pi-1-v2
gcloud config set project $PROJECT_ID

gcloud builds submit --tag  gcr.io/$PROJECT_ID/frontend-admin-ui
gcloud run deploy frontend-admin-ui --image gcr.io/$PROJECT_ID/frontend-admin-ui --platform=managed --region=us-central1 --port=9528 --no-allow-unauthenticated

# docker build -t guli-admin .
# docker run -itd --name guli-admin -p 9528:9528 guli-admin

