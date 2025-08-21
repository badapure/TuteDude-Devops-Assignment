output "instance_public_ip" {
  description = "Public IP of the EC2 instance running Flask and Express"
  value       = aws_instance.web.public_ip
}

output "flask_url" {
  description = "Flask app URL (port 5000)"
  value       = "http://${aws_instance.web.public_ip}:5000"
}

output "express_url" {
  description = "Express app URL (port 3000)"
  value       = "http://${aws_instance.web.public_ip}:3000"
}