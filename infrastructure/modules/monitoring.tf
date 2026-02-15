# Variables
variable "instance_id" {
  description = "EC2 instance ID to monitor"
  type        = string
}

variable "sns_topic_arn" {
  description = "SNS topic ARN for alarm notifications"
  type        = string
}

variable "alarm_name" {
  description = "Name of the CloudWatch alarm"
  type        = string
  default     = "GroceryAlarm"
}

variable "threshold" {
  description = "CPU utilization threshold for alarm"
  type        = number
  default     = 95
}

variable "evaluation_periods" {
  description = "Number of periods to evaluate for alarm"
  type        = number
  default     = 1
}

variable "period" {
  description = "Period in seconds for each evaluation"
  type        = number
  default     = 300
}

# CloudWatch Alarm
resource "aws_cloudwatch_metric_alarm" "my_watch" {
  alarm_name                = var.alarm_name
  comparison_operator       = "GreaterThanThreshold"
  evaluation_periods        = var.evaluation_periods
  metric_name               = "CPUUtilization"
  namespace                 = "AWS/EC2"
  period                    = var.period
  statistic                 = "Average"
  threshold                 = var.threshold
  alarm_description         = "This metric monitors EC2 CPU utilization"
  insufficient_data_actions = []
  alarm_actions             = [var.sns_topic_arn]

  dimensions = {
    InstanceId = var.instance_id
  }
}

# Output
output "alarm_name" {
  value = aws_cloudwatch_metric_alarm.my_watch.alarm_name
}
