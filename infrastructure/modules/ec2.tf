##############################
# Dynamic Ubuntu AMI Lookup
##############################
data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"] # Canonical
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }
}

##############################
# EC2 Instance
##############################
resource "aws_instance" "app_server" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [var.security_group_id]

  iam_instance_profile = var.iam_instance_profile

  tags = {
    Name = "AppServer"
  }
}

##############################
# Outputs
##############################
output "instance_id" {
  value = aws_instance.app_server.id
}

output "public_ip" {
  value = aws_instance.app_server.public_ip
}

output "private_ip" {
  value = aws_instance.app_server.private_ip
}
