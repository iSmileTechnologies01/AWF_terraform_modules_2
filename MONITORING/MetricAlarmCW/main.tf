

resource "aws_cloudwatch_metric_alarm" "foobar" {
  alarm_name                = var.alarmname
  comparison_operator       = var.operator
  evaluation_periods        = var.evaluationperiod
  datapoints_to_alarm       = var.datapointsalarm
  metric_name               = var.metricname
  namespace                 = var.namespace
  period                    = var.period
  statistic                 = "Average"
  threshold                 = var.threshold
  treat_missing_data        = "missing"
  alarm_description         = "This metric monitors ec2 cpu utilization"
}

