# Creating the autoscaling launch configuration that contains AWS EC2 instance details
resource "aws_launch_configuration" "aws_autoscale_conf" {

  name          = var.lc_name
# Defining the image ID of AWS EC2 instance
  image_id      = var.img_id
  instance_type = var.inst_type
  key_name = var.key_n
  security_groups = [ "${aws_security_group.sg_ec2.id}" ]

  lifecycle {
    create_before_destroy = true
  }
}