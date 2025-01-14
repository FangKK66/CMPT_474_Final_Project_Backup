#!/bin/bash
# HOME=${PWD}
PROJECT_ID=cmpt-474-project-pi-1-v2
gcloud config set project $PROJECT_ID

cd $HOME/SFU-CMPT474-Group_Project-NewRepo/api-gateway
gcloud builds submit --tag  gcr.io/$PROJECT_ID/backend-api-gateway
gcloud run deploy backend-api-gateway --image gcr.io/$PROJECT_ID/backend-api-gateway --platform=managed --region=us-central1 --port=8222 --no-allow-unauthenticated
# docker build -t api-gateway .
# docker run -itd --name api-gateway -p 8222:8222 api-gateway

cd $HOME/SFU-CMPT474-Group_Project-NewRepo/service/service_acl
gcloud builds submit --tag  gcr.io/$PROJECT_ID/backend-microservice-acl
gcloud run deploy backend-microservice-acl --image gcr.io/$PROJECT_ID/backend-microservice-acl --platform=managed --region=us-central1 --port=8008 --no-allow-unauthenticated
# docker build -t service_acl .
# docker run -itd --name service_acl -p 8008:8008 service_acl

cd $HOME/SFU-CMPT474-Group_Project-NewRepo/service/service_cms
gcloud builds submit --tag  gcr.io/$PROJECT_ID/backend-microservice-cms
gcloud run deploy backend-microservice-cms --image gcr.io/$PROJECT_ID/backend-microservice-cms --platform=managed --region=us-central1 --port=8004 --no-allow-unauthenticated
# docker build -t service_cms .
# docker run -itd --name service_cms -p 8004:8004 service_cms

cd $HOME/SFU-CMPT474-Group_Project-NewRepo/service/service_edu
gcloud builds submit --tag  gcr.io/$PROJECT_ID/backend-microservice-edu
gcloud run deploy backend-microservice-edu --image gcr.io/$PROJECT_ID/backend-microservice-edu --platform=managed --region=us-central1 --port=8001 --no-allow-unauthenticated
# docker build -t service_edu .
# docker run -itd --name service_edu -p 8001:8001 service_edu

cd $HOME/SFU-CMPT474-Group_Project-NewRepo/service/service_msm
gcloud builds submit --tag  gcr.io/$PROJECT_ID/backend-microservice-msm
gcloud run deploy backend-microservice-msm --image gcr.io/$PROJECT_ID/backend-microservice-msm --platform=managed --region=us-central1 --port=8005 --no-allow-unauthenticated
# docker build -t service_msm .
# docker run -itd --name service_msm -p 8005:8005 service_msm

cd $HOME/SFU-CMPT474-Group_Project-NewRepo/service/service_order
gcloud builds submit --tag  gcr.io/$PROJECT_ID/backend-microservice-order
gcloud run deploy backend-microservice-order --image gcr.io/$PROJECT_ID/backend-microservice-order --platform=managed --region=us-central1 --port=8006 --no-allow-unauthenticated
# docker build -t service_order .
# docker run -itd --name service_order -p 8006:8006 service_order

cd $HOME/SFU-CMPT474-Group_Project-NewRepo/service/service_oss
gcloud builds submit --tag  gcr.io/$PROJECT_ID/backend-microservice-oss
gcloud run deploy backend-microservice-oss --image gcr.io/$PROJECT_ID/backend-microservice-oss --platform=managed --region=us-central1 --port=8002 --no-allow-unauthenticated
# docker build -t service_oss .
# docker run -itd --name service_oss -p 8002:8002 service_oss

cd $HOME/SFU-CMPT474-Group_Project-NewRepo/service/service_statistics
gcloud builds submit --tag  gcr.io/$PROJECT_ID/backend-microservice-statistics
gcloud run deploy backend-microservice-statistics --image gcr.io/$PROJECT_ID/backend-microservice-statistics --platform=managed --region=us-central1 --port=8007 --no-allow-unauthenticated
# docker build -t service_statistics .
# docker run -itd --name service_statistics -p 8007:8007 service_statistics

cd $HOME/SFU-CMPT474-Group_Project-NewRepo/service/service_ucenter
gcloud builds submit --tag  gcr.io/$PROJECT_ID/backend-microservice-ucenter
gcloud run deploy backend-microservice-ucenter --image gcr.io/$PROJECT_ID/backend-microservice-ucenter --platform=managed --region=us-central1 --port=8160 --no-allow-unauthenticated
# docker build -t service_ucenter .
# docker run -itd --name service_ucenter -p 8160:8160 service_ucenter

cd $HOME/SFU-CMPT474-Group_Project-NewRepo/service/service_vod
gcloud builds submit --tag  gcr.io/$PROJECT_ID/backend-microservice-vod
gcloud run deploy backend-microservice-vod --image gcr.io/$PROJECT_ID/backend-microservice-vod --platform=managed --region=us-central1 --port=8003 --no-allow-unauthenticated
# docker build -t service_vod .
# docker run -itd --name service_vod -p 8003:8003 service_vod

