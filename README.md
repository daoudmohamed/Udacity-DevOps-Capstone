[![CircleCI](https://circleci.com/gh/daoudmohamed/Udacity_microservice.svg?style=svg&circle-token=ba7d7e8b3c3b3181b2e4111f310583f2e92c28a1)](https://app.circleci.com/settings/project/github/daoudmohamed/Udacity-DevOps-Capstone)

# Udacity-DevOps-Capstone
Udacity's cloud devops nanodegree capstone project

## Objectives
- Working in AWS
- Using CircleCi to implement Continuous Integration and Continuous Deployment
- Building pipelines
- Working with Ansible and CloudFormation to deploy clusters
- Building Kubernetes clusters
- Building Docker containers in pipelines

## Tools Used
- Git & GitHub
- AWS & AWS-CLI
- Python3
- Flask framework.
- pip3
- Pylint
- Docker & Docker-Hub Registery
- CircleCi
- Kubernetes CLI (kubectl)
- EKS
- CloudFormation
- BASH
- LucidChart

## Cluster creation

The cluster and the worker node group creation is managed by cloudformation configuration file. ( aws/cluster.yml and aws/workers.yml )

You can create the stacks via the folowing command : 

	aws cloudformation create-stack --stack-name UdacityCapStone --template-body file://cluster.yml --parameters file://cluster-params.json --capabilities CAPABILITY_IAM
	aws cloudformation create-stack --stack-name UdacityCapStone-workers --template-body file://workers.yml --parameters file://workers-params.json --capabilities CAPABILITY_IAM

![Cluster stack](https://github.com/daoudmohamed/Udacity-DevOps-Capstone/blob/main/images/claster.JPG)

![Workers stack](https://github.com/daoudmohamed/Udacity-DevOps-Capstone/blob/main/images/worker.JPG)

![Worker](https://github.com/daoudmohamed/Udacity-DevOps-Capstone/blob/main/images/worker-instance.JPG)

Once the cluster and the worker node are created you need to link them together via this command:

    kubectl apply -f aws-auth-cm.yaml
  
Be sure that the kubectl is well configured with the aws cluster, you can do it via this command:

    aws eks --region region-code update-kubeconfig --name cluster_name
    
## Pipeline

![Pipeline](https://github.com/daoudmohamed/Udacity-DevOps-Capstone/blob/main/images/pipeline.JPG)

## Rolling update

Within every pipeline build, a new docker image is pushed to Docker Hub, this new image is then used in the cluster via kubesctl.

This deployement method has the minimal downtime, it is managed by kubernetes loadbalancer. Even if the update fails, kubernetes will rollback to the last stable version.

![Blue version](https://github.com/daoudmohamed/Udacity-DevOps-Capstone/blob/main/images/blue.JPG)
![Green version](https://github.com/daoudmohamed/Udacity-DevOps-Capstone/blob/main/images/green.JPG)
![Board overview](https://github.com/daoudmohamed/Udacity-DevOps-Capstone/blob/main/images/kubectl.JPG)


