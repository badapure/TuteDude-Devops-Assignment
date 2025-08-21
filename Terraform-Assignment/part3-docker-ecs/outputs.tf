output "load_balancer_dns_name" {
  value = module.alb.alb_dns_name
}

output "flask_url" {
  value = "http://${module.alb.alb_dns_name}/flask"
}

output "express_url" {
  value = "http://${module.alb.alb_dns_name}/express"
}
