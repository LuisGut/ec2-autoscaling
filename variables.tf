variable "lc_name" {
  description = "Launch config name"
  type        = string
}

variable "img_id" {
  description = "Ami id"
  type        = string
}

variable "inst_type" {
  description = "Instance type"
  type        = string
}

variable "key_n" {
  description = "Key_name.pem"
  type        = string
}

variable "au_gr_name" {
  description = "Auto scaling group name"
  type        = string
}

variable "subnets_private" {
  description = "Auto scaling group name"
  type        = string
}

variable "aug_max_size" {
  description = "Auto Scaling group max size"
  type        = string
}

variable "aug_min_size" {
  description = "Auto Scaling group min size"
  type        = string
}

variable "aug_desired_capacity" {
  description = "Auto Scaling group desired capacity"
  type        = string
}

variable "aug_policy_name_up" {
  description = "Autoscaling policy name up"
  type        = string
}

variable "aug_policy_name_down" {
  description = "Autoscaling policy name down"
  type        = string
}

variable "threshold_alert_up" {
  description = "Threshold up"
  type        = string
}

variable "threshold_alert_down" {
  description = "Threshold down"
  type        = string
}

variable "sg_elb_bo-st" {
  description = "Security group elb"
  type        = string
}

variable "desc_sg_elb_bo-st" {
  description = "Description Security group elb"
  type        = string
}

variable "vpc_id" {
  description = "Vpc id"
  type        = string
}

variable "elb_name" {
  description = "Elb name"
  type        = string
}

variable "region" {
  description = "AWS region"
}