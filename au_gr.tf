# Creating the autoscaling group
resource "aws_autoscaling_group" "au_gr" {

  name                      = var.au_gr_name
  max_size                  = var.aug_max_size
  min_size                  = var.aug_min_size
  desired_capacity          = var.aug_desired_capacity
  health_check_type         = "ELB"
  vpc_zone_identifier       = ["${split(",",var.subnets_private)}"]
  
  load_balancers = [
    "${aws_elb.bo-elb-st.id}"
  ]

  launch_configuration = "${aws_launch_configuration.aws_autoscale_conf.name}"

  enabled_metrics = [
    "GroupMinSize",
    "GroupMaxSize",
    "GroupDesiredCapacity",
    "GroupInServiceInstances",
    "GroupTotalInstances"
  ]

  metrics_granularity = "1Minute"

  # Required to redeploy without an outage.
  lifecycle {
    create_before_destroy = true
  }
}