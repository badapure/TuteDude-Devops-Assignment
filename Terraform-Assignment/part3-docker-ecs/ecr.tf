resource "aws_ecr_repository" "flask" {
  name = "flask-app"
}

resource "aws_ecr_repository" "express" {
  name = "express-app"
}

output "flask_ecr_repo_url" {
  value = aws_ecr_repository.flask.repository_url
}

output "express_ecr_repo_url" {
  value = aws_ecr_repository.express.repository_url
}
