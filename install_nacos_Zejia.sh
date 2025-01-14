#!/bin/bash
# HOME=${PWD}
PROJECT_ID=cmpt474-414409
gcloud config set project $PROJECT_ID

gcloud auth login

gcloud auth configure-docker

gcloud projects add-iam-policy-binding $PROJECT_ID --member=user:hucsfu@gmail.com --role=roles/editor

docker pull nacos/nacos-server:1.4.1
docker tag nacos/nacos-server:1.4.1 gcr.io/$PROJECT_ID/nacos/nacos-server:1.4.1
docker push gcr.io/$PROJECT_ID/nacos/nacos-server:1.4.1

# then go to google cloud run, create service manauly.
# https://'service-address'/nacos
