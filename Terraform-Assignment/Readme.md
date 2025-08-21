# AWS Flask + Express Deployment using Terraform

## Part 1: Single EC2 Deployment
- Flask on port 5000
- Express on port 3000
- EC2 public IP used to test both apps

## Part 2: Dual EC2 Deployment
- Flask on one EC2, Express on another
- Interconnected via security groups

## Part 3: Docker + ECS + ECR + ALB
- Containers deployed using ECS Fargate
- Docker images pushed to ECR
- Load balanced via ALB

## Commands Used
```bash
terraform init
terraform plan
terraform apply
