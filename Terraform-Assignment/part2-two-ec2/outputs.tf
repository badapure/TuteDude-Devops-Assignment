output "flask_instance_ip" {
  description = "Public IP of the EC2 instance running Flask"
  value       = aws_instance.flask.public_ip
}

output "express_instance_ip" {
  description = "Public IP of the EC2 instance running Express"
  value       = aws_instance.express.public_ip
}

output "flask_url" {
  description = "Flask app URL (port 5000)"
  value       = "http://${aws_instance.flask.public_ip}:5000"
}

output "express_url" {
  description = "Express app URL (port 3000)"
  value       = "http://${aws_instance.express.public_ip}:3000"
}
