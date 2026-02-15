# Variables
variable "ami" {
  description = "AMI ID for EC2 instance (optional, overridden by dynamic lookup)"
  type        = string
  default     = null
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID where EC2 instance will be deployed"
  type        = string
}

variable "security_group_id" {
  description = "Security group ID to assign to EC2 instance"
  type        = string
}

variable "iam_instance_profile" {
  description = "IAM instance profile for the EC2 instance"
  type        = string
  default     = null
}

# Dynamic Ubuntu AMI Lookup
data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"] # Canonical
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }
}

# EC2 Instance
resource "aws_instance" "app_server" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [var.security_group_id]
  iam_instance_profile   = var.iam_instance_profile

  tags = {
    Name = "AppServer"
  }
}

# Outputs
output "instance_id" {
  value = aws_instance.app_server.id
}

output "public_ip" {
  value = aws_instance.app_server.public_ip
}

output "private_ip" {
  value = aws_instance.app_server.private_ip
}
