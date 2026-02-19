########################################
# VARIABLES
########################################

variable "project_name" {
  description = "Project name"
  type        = string
}

variable "environment" {
  description = "Deployment environment (dev, staging, prod)"
  type        = string
}

variable "bucket_suffix" {
  description = "Suffix for the S3 bucket"
  type        = string
  default     = "avatars"
}

########################################
# RANDOM SUFFIX (avoids global name conflicts)
########################################

resource "random_id" "bucket_suffix" {
  byte_length = 4
}

########################################
# LOCALS
########################################

locals {
  bucket_name = "${var.project_name}-${var.bucket_suffix}-${var.environment}-${random_id.bucket_suffix.hex}"
}

########################################
# S3 BUCKET
########################################

resource "aws_s3_bucket" "avatars" {
  bucket = local.bucket_name

  tags = {
    Name        = local.bucket_name
    Environment = var.environment
    Project     = var.project_name
  }
}

########################################
# BLOCK PUBLIC ACCESS
########################################

resource "aws_s3_bucket_public_access_block" "avatars" {
  bucket = aws_s3_bucket.avatars.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
