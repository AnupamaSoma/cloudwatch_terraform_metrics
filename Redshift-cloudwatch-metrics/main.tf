resource "aws_cloudwatch_metric_alarm" "cpu-utilization" {
  alarm_name                = "${var.name_prefix}-Redshift_CPUUtilization-${element(var.clusteridentifier_ids, count.index)}"
  count                     = length(var.clusteridentifier_ids)
  comparison_operator       = "GreaterThanOrEqualToThreshold"
  evaluation_periods        = var.evaluation_periods
  metric_name               = "CPUUtilization"
  namespace                 = "AWS/Redshift"
  period                    = var.period
  statistic                 = "Average"
  threshold                 = var.cpu_utilization_threshold
  alarm_description         = "This metric monitors ec2 cpu utilization"
  alarm_actions             = [ "${aws_sns_topic.redshift_alarm.arn}" ]
  ok_actions                = ["${aws_sns_topic.redshift_alarm.arn}"]
  treat_missing_data        = "notBreaching"

  dimensions = {
    ClusterIdentifier = "${element(var.clusteridentifier_ids, count.index)}"

  }
}
resource "aws_cloudwatch_metric_alarm" "DatabaseConnections" {
  alarm_name                = "${var.name_prefix}-Redshift_DatabaseConnections-${element(var.clusteridentifier_ids, count.index)}"
  count                     = length(var.clusteridentifier_ids)
  comparison_operator       = "GreaterThanOrEqualToThreshold"
  evaluation_periods        = var.evaluation_periods
  metric_name               = "DatabaseConnections"
  namespace                 = "AWS/Redshift"
  period                    = var.period
  statistic                 = "Average"
  threshold                 = var.DatabaseConnections_threshold
  alarm_description         = "This metric monitors DatabaseConnections"
  alarm_actions             = [ "${aws_sns_topic.redshift_alarm.arn}" ]
  ok_actions                = ["${aws_sns_topic.redshift_alarm.arn}"]
  treat_missing_data        = "notBreaching"

  dimensions = {
    ClusterIdentifier = "${element(var.clusteridentifier_ids, count.index)}"

  }
}
resource "aws_cloudwatch_metric_alarm" "HealthStatus" {
  alarm_name                = "${var.name_prefix}-Redshift_HealthStatus-${element(var.clusteridentifier_ids, count.index)}"
  count                     = length(var.clusteridentifier_ids)
  comparison_operator       = "LessThanThreshold"
  evaluation_periods        = var.evaluation_periods
  metric_name               = "HealthStatus"
  namespace                 = "AWS/Redshift"
  period                    = var.period
  statistic                 = "Average"
  threshold                 = var.HealthStatus_threshold
  alarm_description         = "This metric monitors HealthStatus"
  alarm_actions             = [ "${aws_sns_topic.redshift_alarm.arn}" ]
  ok_actions                = ["${aws_sns_topic.redshift_alarm.arn}"]
  treat_missing_data        = "notBreaching"

  dimensions = {
    ClusterIdentifier = "${element(var.clusteridentifier_ids, count.index)}"

  }
}


