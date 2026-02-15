# Variables for S3 bucket
variable "s3_bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
}

variable "environment" {
  description = "Environment tag for the S3 bucket (e.g., Dev, Prod)"
  type        = string
  default     = "Dev"
}

# S3 Bucket
resource "aws_s3_bucket" "avatars" {
  bucket = var.s3_bucket_name

  tags = {
    Name        = var.s3_bucket_name
    Environment = var.environment
  }
}

# S3 Bucket Public Access Block (Block ALL public access)
resource "aws_s3_bucket_public_access_block" "avatars" {
  bucket = aws_s3_bucket.avatars.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

# Outputs
output "s3_bucket_id" {
  value = aws_s3_bucket.avatars.id
}

output "s3_bucket_arn" {
  value = aws_s3_bucket.avatars.arn
}
