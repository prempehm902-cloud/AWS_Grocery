output "ec2_instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.app_server.id
}

output "ec2_public_ip" {
  description = "Public IP of EC2 instance"
  value       = aws_instance.app_server.public_ip
}

output "ec2_private_ip" {
  description = "Private IP of EC2 instance"
  value       = aws_instance.app_server.private_ip
}

output "db_endpoint" {
  description = "RDS endpoint"
  value       = aws_db_instance.app_db.endpoint
}

output "db_instance_id" {
  description = "RDS instance ID"
  value       = aws_db_instance.app_db.id
}

output "app_security_group_id" {
  description = "EC2 security group ID"
  value       = aws_security_group.app1_sg.id
}

output "rds_security_group_id" {
  description = "RDS security group ID"
  value       = aws_security_group.rds_sg.id
}

output "sns_topic_arn" {
  description = "SNS Topic ARN for CloudWatch alerts"
  value       = aws_sns_topic.topic.arn
}

output "cloudwatch_alarm_name" {
  description = "CloudWatch CPU alarm name"
  value       = aws_cloudwatch_metric_alarm.cpu_alarm.alarm_name
}

output "vpc_id" {
  description = "Main VPC ID"
  value       = aws_vpc.main.id
}
