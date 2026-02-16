# AWS region
variable "region" {
  description = "AWS region to deploy resources"
  type        = string
}

# EC2 instance
variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "ec2_ami" {
  description = "EC2 AMI ID. Can be dynamically fetched."
  type        = string
  default     = "" # empty, can use data source
}

# Your public IP for SSH
variable "my_ip" {
  description = "Your public IP for SSH access"
  type        = string
}

# RDS / PostgreSQL
variable "db_name" {
  description = "Database name"
  type        = string
}

variable "db_username" {
  description = "RDS master username"
  type        = string
}

variable "db_password" {
  description = "RDS master password"
  type        = string
  sensitive   = true
}

variable "db_instance_class" {
  description = "RDS instance type"
  type        = string
  default     = "db.t3.micro"
}

variable "db_subnet_group_name" {
  description = "Name of RDS subnet group"
  type        = string
}

# SNS email
variable "sns_email" {
  description = "Email for CloudWatch alerts"
  type        = string
}

# VPC
variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
  default     = "10.0.0.0/16"
}

# Public subnet
variable "public_subnet_cidr" {
  description = "Public subnet CIDR"
  type        = string
  default     = "10.0.1.0/24"
}

variable "public_az" {
  description = "Availability zone for public subnet"
  type        = string
  default     = "eu-central-1a"
}

# Private subnets
variable "private_subnet_1_cidr" {
  description = "Private subnet 1 CIDR"
  type        = string
  default     = "10.0.2.0/24"
}

variable "private_subnet_2_cidr" {
  description = "Private subnet 2 CIDR"
  type        = string
  default     = "10.0.4.0/24"
}

variable "private_az_1" {
  description = "Availability zone for private subnet 1"
  type        = string
  default     = "eu-central-1b"
}

variable "private_az_2" {
  description = "Availability zone for private subnet 2"
  type        = string
  default     = "eu-central-1c"
}
