resource "aws_instance" "flask" {
  # configure Flask instance
  user_data = file("backend-userdata.sh")
}

resource "aws_instance" "express" {
  # configure Express instance
  user_data = file("frontend-userdata.sh")
}

resource "aws_security_group" "web_sg" {
  # allow 3000, 5000 open + intercommunication
}
