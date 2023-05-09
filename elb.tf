resource "aws_elb" "bo-elb-st" {
  name = var.elb_name
  security_groups = [
    "${aws_security_group.sg_elb_bo_st.id}"
  ]
  subnets = ["${split(",",var.subnets_private)}"]
  # subnets = [
  #   "${aws_subnet.demosubnet.id}",
  #   "${aws_subnet.demosubnet1.id}"
  # ]

  cross_zone_load_balancing   = true

  health_check {
    healthy_threshold = 2
    unhealthy_threshold = 2
    timeout = 3
    interval = 30
    target = "HTTP:80/"
  }

  listener {
    lb_port = 80
    lb_protocol = "http"
    instance_port = "80"
    instance_protocol = "http"
  }

}