# Creating the autoscaling policy of the autoscaling group
resource "aws_autoscaling_policy" "au_gr_policy_up" {
  name                   = var.aug_policy_name_up
# The number of instances by which to scale.
  scaling_adjustment     = 1
  adjustment_type        = "ChangeInCapacity"
# The amount of time (seconds) after a scaling completes and the next scaling starts.
  cooldown               = 300
  autoscaling_group_name = "${aws_autoscaling_group.au_gr.name}"
}

resource "aws_cloudwatch_metric_alarm" "cpu_alarm_up" {
# defining the name of AWS cloudwatch alarm
  alarm_name = var.aug_policy_name_up
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods = "2"
# Defining the metric_name according to which scaling will happen (based on CPU) 
  metric_name = "CPUUtilization"
# The namespace for the alarm's associated metric
  namespace = "AWS/EC2"
# After AWS Cloudwatch Alarm is triggered, it will wait for 60 seconds and then autoscales
  period = "60"
  statistic = "Average"
  threshold = var.threshold_alert
  alarm_actions = [
        "${aws_autoscaling_policy.au_gr_policy_up.arn}"
    ]
dimensions = {
    AutoScalingGroupName = "${aws_autoscaling_group.au_gr.name}"
  }
}

resource "aws_autoscaling_policy" "au_gr_policy_down" {
  name = var.aug_policy_name_down
  scaling_adjustment = -1
  adjustment_type = "ChangeInCapacity"
  cooldown = 300
  autoscaling_group_name = "${aws_autoscaling_group.au_gr.name}"
}

resource "aws_cloudwatch_metric_alarm" "cpu_alarm_down" {
  alarm_name = var.aug_policy_name_down
  comparison_operator = "LessThanOrEqualToThreshold"
  evaluation_periods = "2"
  metric_name = "CPUUtilization"
  namespace = "AWS/EC2"
  period = "120"
  statistic = "Average"
  threshold = var.threshold_alert_down

  dimensions = {
    AutoScalingGroupName = "${aws_autoscaling_group.au_gr.name}"
  }

  alarm_actions = [ "${aws_autoscaling_policy.au_gr_policy_down.arn}" ]
}
