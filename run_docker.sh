#!/usr/bin/env bash

## Complete the following steps to get Docker running locally

# Step 1:
# Build image
docker build --tag=flaskskearlndemo .

# Step 2: 
# List docker images
docker images flaskskearlndemo

# Step 3: 
# Run flask app
docker run --name flaskskearlndemo-01 -p 8000:80 flaskskearlndemo:latest &
sleep 60


# Step 4:
# run prediction
./make_prediction.sh

# Step 5:
# Loging 
docker logs -f flaskskearlndemo-01 &> output_txt_files/docker_out.txt &
