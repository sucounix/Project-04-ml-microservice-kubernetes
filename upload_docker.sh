#!/usr/bin/env bash
# This file tags and uploads an image to Docker Hub

# Assumes that an image is built via `run_docker.sh`

# Step 1:
# Create dockerpath
dockerpath=public.ecr.aws/v2o3x6u2/udamicroservice

# Step 2:  
# Authenticate & tag
echo "Docker ID and Image: $dockerpath"
aws ecr-public get-login-password --region us-east-1 | docker login --username AWS --password-stdin public.ecr.aws/v2o3x6u2
docker build -t flaskskearlndemo .
docker tag flaskskearlndemo:latest public.ecr.aws/v2o3x6u2/udamicroservice:latest

# Step 3:
# Push image to a docker repository
docker push public.ecr.aws/v2o3x6u2/udamicroservice:latest
