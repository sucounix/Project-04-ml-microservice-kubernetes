# project-ml-microservice-kubernetes

[![sucounix](https://circleci.com/gh/sucounix/project-ml-microservice-kubernetes.svg?style=svg)](https://app.circleci.com/pipelines/github/sucounix/project-ml-microservice-kubernetes)

# Machine Learning Microservice API
Machine Learning Microservice API

## Summary
This project contains a web application to predict prizes based on machine learning algorithms .
It also contains all the necessary configuration to run the application within a docker container and within a kubernetes cluster.

## How to run the Python scripts
You can either run the application via `python3 app.py` to run it locally, but you're encouraged to run it within a containerized environment.
Please refer to the `run_docker.sh` and `run_kubernetes.sh` scripts.

### Run web app
 Perform: 
 ```shell script
make run
```
It will run the python app in port **80**.
rediredted to port **8000**

## Files in the project
- `run_docker.sh` running the application within docker.
- `run_kubernetes` running the application within kubernetes cluster.
- `make_prediction.sh` once the application is running, this script makes a request to the web server.