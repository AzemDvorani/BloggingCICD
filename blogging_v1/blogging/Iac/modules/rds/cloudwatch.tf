resource "aws_cloudwatch_metric_alarm" "rds_cpu_alarm" {
  alarm_name          = "rds-cpu-utilization"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/RDS"
  period              = 300 #Set the period for the metric in seconds
  statistic           = "Average"
  threshold           = 90
  alarm_description   = "Alarm when RDS CPU utilization is greater than 90%."

  # dimensions = {
  #   DBInstanceIdentifier = aws_db_instance.rds.identifier
  # }

  # alarm_actions = [aws_sns_topic.xemi_topic.arn]
}

# resource "aws_sns_topic" "xemi_topic" {
#   name = "xemi-topic"
#   display_name = "xemi Topic"
# }