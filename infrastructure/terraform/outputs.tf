# EC2 Instance ID
output "ec2_instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.app_server.id
}

# EC2 Public IP
output "ec2_public_ip" {
  description = "Public IP of the EC2 instance"
  value       = aws_instance.app_server.public_ip
}

# RDS Endpoint
output "db_endpoint" {
  description = "RDS database endpoint"
  value       = aws_db_instance.app_db.endpoint
}

# RDS Instance ID
output "db_instance_id" {
  description = "RDS instance ID"
  value       = aws_db_instance.app_db.id
}

# Security group for app
output "app_security_group_id" {
  description = "Security group ID for EC2"
  value       = aws_security_group.app1_sg.id
}

# Security group for RDS
output "rds_security_group_id" {
  description = "Security group ID for RDS"
  value       = aws_security_group.rds_sg.id
}

# SNS Topic ARN
output "sns_topic_arn" {
  description = "SNS topic ARN for CloudWatch alerts"
  value       = aws_sns_topic.topic.arn
}

# VPC ID
output "vpc_id" {
  description = "ID of the main VPC"
  value       = aws_vpc.main.id
}
