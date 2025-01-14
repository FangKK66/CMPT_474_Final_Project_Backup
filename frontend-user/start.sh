#!/bin/bash
PROJECT_ID=cmpt-474-project-pi-1-v2
gcloud config set project $PROJECT_ID

gcloud builds submit --tag  gcr.io/$PROJECT_ID/frontend-user-ui
gcloud run deploy frontend-user-ui --image gcr.io/$PROJECT_ID/frontend-user-ui --platform=managed --region=us-central1 --port=9000 --no-allow-unauthenticated

# docker build -t guli-front .
# docker run -itd --name guli-front -p 9000:9000 guli-front

