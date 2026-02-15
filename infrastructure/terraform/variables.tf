# AWS region
variable "region" {
  description = "AWS region to deploy resources"
  type        = string
}

# EC2 instance type
variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

# EC2 AMI
variable "ec2_ami" {
  description = "AMI ID for EC2 instance. Use a regional AMI or dynamically look it up"
  type        = string
}

# PostgreSQL database name
variable "db_name" {
  description = "Name of the PostgreSQL database"
  type        = string
}

# PostgreSQL master username
variable "db_username" {
  description = "Master username for the RDS database"
  type        = string
}

# PostgreSQL master password (sensitive)
variable "db_password" {
  description = "Master password for the RDS database"
  type        = string
  sensitive   = true
}

# RDS instance class
variable "db_instance_class" {
  description = "RDS instance class type"
  type        = string
  default     = "db.t3.micro"
}

# Your public IP for SSH
variable "my_ip" {
  description = "Your public IP address allowed for SSH, in CIDR format (e.g., 123.45.67.89/32)"
  type        = string
}

# SNS email for CloudWatch alerts
variable "sns_email" {
  description = "Email address to receive CloudWatch SNS alerts"
  type        = string
}

# VPC CIDR
variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

# Public subnet CIDR and AZ
variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet"
  type        = string
}

variable "public_az" {
  description = "Availability zone for public subnet"
  type        = string
}

# Private subnets CIDR and AZs
variable "private_subnet_1_cidr" {
  description = "CIDR block for private subnet 1"
  type        = string
}

variable "private_subnet_2_cidr" {
  description = "CIDR block for private subnet 2"
  type        = string
}

variable "private_az_1" {
  description = "Availability zone for private subnet 1"
  type        = string
}

variable "private_az_2" {
  description = "Availability zone for private subnet 2"
  type        = string
}

# RDS subnet group name
variable "db_subnet_group_name" {
  description = "Name for RDS subnet group"
  type        = string
}
