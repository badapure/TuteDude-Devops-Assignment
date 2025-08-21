variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "ap-south-1"
}


### outputs.tf ###

output "load_balancer_dns" {
  value       = module.alb.alb_dns
  description = "DNS of the Application Load Balancer"
}

output "flask_image_url" {
  value       = module.ecr.flask_image_url
  description = "ECR Image URL for Flask"
}

output "express_image_url" {
  value       = module.ecr.express_image_url
  description = "ECR Image URL for Express"
}
