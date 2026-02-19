# variables.tf
variable "project_name" {
  description = "Project name used for resource naming"
  type        = string
  default     = "grocerymate"
}

variable "environment" {
  description = "Deployment environment (e.g., Dev, Staging, Prod)"
  type        = string
  default     = "Dev"
}

variable "bucket_suffix" {
  description = "Unique suffix to ensure bucket name uniqueness across AWS"
  type        = string
}

# locals for consistent naming
locals {
  bucket_name = "${var.project_name}-avatars-${var.bucket_suffix}"
  common_tags = {
    Project     = var.project_name
    Environment = var.environment
  }
}

# main.tf
resource "aws_s3_bucket" "avatars" {
  bucket = local.bucket_name

  tags = merge(
    local.common_tags,
    {
      Name = "${var.project_name}-avatars"
    }
  )
}

resource "aws_s3_bucket_public_access_block" "avatars" {
  bucket = aws_s3_bucket.avatars.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
