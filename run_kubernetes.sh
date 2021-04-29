#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
# dockerpath=<>
dockerpath=public.ecr.aws/v2o3x6u2/udamicroservice

# Step 2
# Run the Docker Hub container with kubernetes
# kubectl run flaskskearlndemo\
#     --generator=run-pod/v1\
#     --image=$dockerpath\
#     --port=80 --labels app=flaskskearlndemo


# kubectl create deployment flaskskearlndemo --image=$dockerpath:v1 --port=80 --labels app=flaskskearlndemo
# kubectl scale deployment flaskskearlndemo --replicas=3


kubectl apply -f flaskskearlndemo.yaml

sleep 200

kubectl autoscale deployment flaskskearlndemo --cpu-percent=50 --min=1 --max=5

sleep 10

# Step 3:
# List kubernetes pods
kubectl get pods
kubectl get hpa

# # Step 4:
# # Forward the container port to a host

 kubectl port-forward deployment/flaskskearlndemo 8000:80 &
 
 sleep 20

# Step 4:
# run prediction
./make_prediction.sh

# Step 5:
# Loging 
kubectl logs deployment/flaskskearlndemo > output_txt_files/kubernetes_out.txt

#Tests
#Increase load 
#kubectl run -i --tty load-generator --rm --image=busybox --restart=Never -- /bin/sh -c "while sleep 0.01; do wget -q -O- http://flaskskearlndemo; done"

