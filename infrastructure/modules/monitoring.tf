# ---------------------------
# SNS Topic for CloudWatch Alerts
# ---------------------------
resource "aws_sns_topic" "topic" {
  name = "app_server_cpu_alert"
  tags = merge(var.common_tags, { Name = "app_server_cpu_alert" })
}

resource "aws_sns_topic_subscription" "email" {
  topic_arn = aws_sns_topic.topic.arn
  protocol  = "email"
  endpoint  = var.sns_email
}

# ---------------------------
# CloudWatch CPU Alarm
# ---------------------------
resource "aws_cloudwatch_metric_alarm" "cpu_alarm" {
  alarm_name                = "GroceryAlarm"
  comparison_operator       = "GreaterThanThreshold"
  evaluation_periods        = 1
  datapoints_to_alarm       = 1
  metric_name               = "CPUUtilization"
  namespace                 = "AWS/EC2"
  period                    = 300
  statistic                 = "Average"
  threshold                 = 95
  alarm_description         = "CPU threshold alarm"
  treat_missing_data        = "missing"
  insufficient_data_actions = []

  dimensions = {
    InstanceId = aws_instance.app_server.id
  }

  tags = merge(var.common_tags, { Name = "GroceryAlarm" })
}
