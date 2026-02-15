# Variables
variable "vpc_id" {
  description = "VPC ID where the security group will be created"
  type        = string
}

variable "my_ip" {
  description = "Your public IP address allowed for SSH, in CIDR format (e.g., 123.45.67.89/32)"
  type        = string
}

# Security Group for the application
resource "aws_security_group" "app_sg" {
  name        = "app-sg"
  description = "Allow SSH, HTTP, and Flask app traffic"
  vpc_id      = var.vpc_id

  # SSH ingress (restricted to your IP)
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.my_ip]
  }

  # HTTP ingress
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Flask app ingress
  ingress {
    from_port   = 5000
    to_port     = 5000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow all outbound traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Outputs
output "app_sg_id" {
  value = aws_security_group.app_sg.id
}
